import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/core/app/application/app_controller.dart';
import 'package:flutter_starter_template/feature/auth/presentation/signin_screen.dart';
import 'package:flutter_starter_template/feature/auth/presentation/signup_screen.dart';
import 'package:flutter_starter_template/feature/home/presentation/home_screen.dart';

class AppObserver extends ConsumerWidget {
  const AppObserver({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appNotifierProvider).asData!.value;

    return Scaffold(
      body: Center(
        child: appState.map(
            started: (_) => const CircularProgressIndicator(),
            authenticated: (_) => const HomeScreen(),
            unAuthenticated: (value) {
              if (value.isSignIn) return const SignInScreen();
              return const SignUpScreen();
            }),
      ),
    );
  }
}
