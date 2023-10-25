import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/core/extension/context_extension.dart';
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
  final _emailController =
      TextEditingController(text: 'sauzanbindukar@gmail.com');
  final _passwordController = TextEditingController(text: 'saujan123');
  @override
  Widget build(BuildContext context) {
    ref.listen(signInProvider, (prev, next) {
      if (next is AsyncError) {
        final error = next.error;
        context.showSnackBar(message: '$error');
      }
      if (next is AsyncData) {
        final error = next.value;
        context.showSnackBar(message: '$error');
      }
    });
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Consumer(builder: (context, ref, child) {
                final authState = ref.watch(signInProvider);

                return ElevatedButton(
                  onPressed: () {
                    ref.read(signInProvider.notifier).login(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                  },
                  child: authState is AsyncLoading
                      ? const CircularProgressIndicator()
                      : const Text('Login'),
                );
              }),
              Consumer(builder: (context, ref, child) {
                final authState = ref.watch(signUpProvider);

                return ElevatedButton(
                  onPressed: () {
                    ref.read(signUpProvider.notifier).signup();
                  },
                  child: authState is AsyncLoading
                      ? const CircularProgressIndicator()
                      : const Text('SignUp'),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
