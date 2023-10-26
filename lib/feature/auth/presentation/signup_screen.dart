import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/core/app/app_state.dart';
import 'package:flutter_starter_template/core/app/application/app_controller.dart';
import 'package:flutter_starter_template/core/widgets/custom_button.dart';
import 'package:flutter_starter_template/core/widgets/custom_textfield.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ref
                .read(appNotifierProvider.notifier)
                .updateAppState(const AppState.unAuthenticated(isSignIn: true));
          },
          icon: const Icon(Icons.chevron_left_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please enter your details',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _nameController,
                hintText: 'Full Name',
              ),
              CustomTextField(
                controller: _emailController,
                hintText: 'Email',
              ),
              CustomTextField(
                controller: _addressController,
                hintText: 'Address',
              ),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              CustomButton(
                padding: const EdgeInsets.symmetric(vertical: 20),
                onPressed: () {},
                name: 'Sign up',
              ),
              const _SignInNavigationWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SignInNavigationWidget extends ConsumerWidget {
  const _SignInNavigationWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
        ),
        InkWell(
          onTap: () {
            ref
                .read(appNotifierProvider.notifier)
                .updateAppState(const AppState.unAuthenticated(isSignIn: true));
          },
          child: Text(
            'Sign In',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
