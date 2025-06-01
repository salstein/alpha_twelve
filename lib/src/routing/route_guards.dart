// ignore_for_file: depend_on_referenced_packages

// import 'package:collection/collection.dart';
import 'package:alpha_twelve/src/app/app_state_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router_config.dart';

class FromTabRouteGuard extends NavigatorObserver {
  final WidgetRef ref;

  FromTabRouteGuard(this.ref);

  @override
  void didPush(Route route, Route? previousRoute) {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {});
  }
}

class UnauthorizedRouteGuard extends NavigatorObserver {
  final WidgetRef ref;

  UnauthorizedRouteGuard(this.ref);

  @override
  void didPush(Route route, Route? previousRoute) {
    if (route.settings.name case final routeName?) {
      if ({
        AppRoute.authScreen.name,
      }.contains(routeName)) {
        WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
          ref.read(appStateVMNotifier.notifier).logout();
        });
        return;
      }

      //
      if (routeName == AppRoute.welcomeScreen.name) {
        WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((_) {
          ref.read(appStateVMNotifier.notifier).signOut();
        });
      }
    }
  }
}

class ScreenViewRouteObserver extends NavigatorObserver {
  final WidgetRef ref;

  ScreenViewRouteObserver(this.ref);

  @override
  void didPush(Route route, Route? previousRoute) async {
    String? previousRoute;
    if (route.settings.name case final routeName?) {
      if (previousRoute != routeName) {}

      previousRoute = routeName;
    }
  }
}
