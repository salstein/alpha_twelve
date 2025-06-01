import 'package:alpha_twelve/src/features/product/presentation/screen/product_details_screen.dart';
import 'package:alpha_twelve/src/features/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/bottom navigation/presentation/bottom_nav_bar.dart';
import '../features/cart/presentation/screens/cart_screen.dart';
import 'route_guards.dart';
import 'router_config.dart';

final class AppRouter {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();

  AppRouter(WidgetRef ref) {
    mainRouter = _getRouter(ref);
  }

  late GoRouter mainRouter;

  GoRouter _getRouter(WidgetRef ref) => GoRouter(
        navigatorKey: rootNavigatorKey,
        debugLogDiagnostics: kDebugMode,
        initialLocation: RoutePath.splash,
        observers: [
          FromTabRouteGuard(ref),
          UnauthorizedRouteGuard(ref),
          ScreenViewRouteObserver(ref),
        ],
        routes: [
          GoRoute(
            path: RoutePath.splash,
            name: AppRoute.splashscreen.name,
            builder: (context, state) => const SplashScreen(),
          ),
          GoRoute(
              path: RoutePath.bottomNavigation,
              name: AppRoute.bottomNavigationScreen.name,
              builder: (context, state) => const CustomBottomNavBar()),
          GoRoute(
              path: "${RoutePath.productDetailsPage}/:id",
              name: AppRoute.productDetailsScreen.name,
              builder: (context, state) {
                final productId =
                    int.tryParse(state.pathParameters['id'] ?? "0") ?? 0;
                return ProductDetailsScreen(
                  productId: productId,
                );
              }),
          GoRoute(
            path: RoutePath.cart,
            name: AppRoute.cartScreen.name,
            builder: (context, state) => const CartScreen(),
          )
        ],
      );
}
