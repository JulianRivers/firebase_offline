import 'package:firebase_offline/core/navigation/app_routes.dart';
import 'package:firebase_offline/features/auth/presentation/pages/sign_in_page.dart';
import 'package:firebase_offline/features/auth/presentation/pages/sign_up_page.dart';
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
      GoRoute(
        path: AppRoutes.root,
        name: '/',
        builder: (context, state) => SignUpPage(),
      ),
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => SignInPage(),
      ),
      GoRoute(
        path: AppRoutes.register,
        name: 'register',
        builder: (context, state) => SignUpPage(),
      ),
      // ShellRoute(
      //   navigatorKey: _shellNavigatorKey,
      //   routes: [GoRoute(path: AppRoutes.home, name: 'home')],
      // ),
    ],
  );
}
