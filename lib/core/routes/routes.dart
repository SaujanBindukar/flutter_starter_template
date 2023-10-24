import 'package:flutter_starter_template/core/app/app_observer.dart';
import 'package:flutter_starter_template/feature/auth/presentation/signin_screen.dart';
import 'package:flutter_starter_template/feature/auth/presentation/signup_screen.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    )
  ],
);
