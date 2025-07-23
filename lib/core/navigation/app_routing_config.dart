import 'package:firebase_offline/core/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutingConfig {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.root,
    // redirect: NavigationGuard.authGuard,
    routes: [
      GoRoute(path: AppRoutes.login, name: 'login'),
      GoRoute(path: AppRoutes.register, name: 'register'),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        routes: [GoRoute(path: AppRoutes.home, name: 'home')],
      ),
    ],
  );
}
