import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/core/app/infrastructure/app_state.dart';
import 'package:flutter_starter_template/core/app/application/app_controller.dart';
import 'package:flutter_starter_template/core/extension/context_extension.dart';
import 'package:flutter_starter_template/core/utils/validators.dart';
import 'package:flutter_starter_template/core/widgets/custom_button.dart';
import 'package:flutter_starter_template/core/widgets/custom_textfield.dart';
import 'package:flutter_starter_template/feature/auth/application/auth_controller.dart';

final signInProvider =
    AutoDisposeAsyncNotifierProvider<AuthNotifier, Object?>(AuthNotifier.new);

final signUpProvider =
    AutoDisposeAsyncNotifierProvider<AuthNotifier, Object?>(AuthNotifier.new);

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //listen the state when the signin button is pressed
    ref.listen(signInProvider, (prev, next) {
      if (next is AsyncError) {
        context.showSnackBar(message: '${next.error}');
      }
    });
    //
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome to Demo App",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  'Please enter your details',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  validator: Validators.emailValidator,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_open_outlined),
                  validator: Validators.passwordValidators,
                ),
                const SizedBox(height: 20),
                Consumer(
                  builder: (context, ref, child) {
                    final authState = ref.watch(signInProvider);
                    return CustomButton(
                      padding: EdgeInsets.zero,
                      name: 'Login',
                      isLoading: authState is AsyncLoading,
                      onPressed: _onSignIn,
                    );
                  },
                ),
                const SizedBox(height: 20),
                const _SingupNavigationWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSignIn() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    ref.read(signInProvider.notifier).login(
          email: _emailController.text,
          password: _passwordController.text,
        );
  }
}

class _SingupNavigationWidget extends ConsumerWidget {
  const _SingupNavigationWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
        ),
        InkWell(
          onTap: () {
            ref.read(appNotifierProvider.notifier).updateAppState(
                const AppState.unAuthenticated(isSignIn: false));
          },
          child: Text(
            'Sign Up',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
