import 'package:flutter_starter_template/core/app/app_observer.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const AppObserver(),
    )
  ],
);
