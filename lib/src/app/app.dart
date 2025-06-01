import 'dart:async';
import 'dart:ui';

import 'package:alpha_twelve/src/app/app_state_vm.dart';
import 'package:alpha_twelve/src/routing/app_router.dart';
import 'package:alpha_twelve/src/style/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<App> {
  late Timer logoutTimer;
  late AppRouter appRouter;
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();

    appRouter = AppRouter(ref);
    _listener = AppLifecycleListener(
      onExitRequested: _onExitRequested,
    );

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) async {
      _initialiseTimer();
    });
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  void _initialiseTimer() {
    logoutTimer =
        Timer.periodic(const Duration(minutes: 5), (_) => _logoutUser());
  }

  void _logoutUser() {
    ref.read(appStateVMNotifier.notifier).logout();
  }

  void _handleUserInteraction() {
    if (!logoutTimer.isActive) {
      _initialiseTimer();
      return;
    }

    logoutTimer.cancel();
    _initialiseTimer();
  }

  void _unfocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void _pointerHandler(PointerEvent event) {
    _handleUserInteraction();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: _pointerHandler,
      onPointerCancel: _pointerHandler,
      onPointerUp: _pointerHandler,
      onPointerMove: _pointerHandler,
      onPointerHover: _pointerHandler,
      onPointerSignal: _pointerHandler,
      behavior: HitTestBehavior.deferToChild,
      child: GestureDetector(
          onTap: _unfocus,
          child: ScreenUtilInit(
              designSize: const Size(374, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (_, child) {
                return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    routerConfig: appRouter.mainRouter,
                    title: const String.fromEnvironment('APP_TITLE'),
                    theme: AppTheme.lightTheme,
                    darkTheme: AppTheme.lightTheme);
              })),
    );
  }

  Future<AppExitResponse> _onExitRequested() async {
    final response = await showDialog<AppExitResponse>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog.adaptive(
        title: const Text('Are you sure you want to quit this app?'),
        content: const Text('All unsaved progress will be lost.'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(AppExitResponse.cancel);
            },
          ),
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(AppExitResponse.exit);
            },
          ),
        ],
      ),
    );

    return response ?? AppExitResponse.cancel;
  }
}
