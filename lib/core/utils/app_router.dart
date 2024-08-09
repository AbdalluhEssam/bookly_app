import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/views/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String splashView = '/';
  static const String homeView = '/homeView';

  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: splashView,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: homeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
    ],
  );
}
