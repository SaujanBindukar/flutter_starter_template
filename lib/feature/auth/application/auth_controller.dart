import 'package:flutter_starter_template/core/app/application/app_controller.dart';
import 'package:flutter_starter_template/core/app/app_state.dart';
import 'package:flutter_starter_template/feature/auth/infrastructure/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> signup() async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 5));

    state = const AsyncData<dynamic>('');
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    final authRepo = ref.read(iAuthRespositoryProvider);
    final response = await authRepo.login(
      email: email,
      password: password,
    );

    response.fold((failure) {
      state = AsyncValue.error(
        failure.reason,
        StackTrace.current,
      );
    }, (success) async {
      await ref.read(iAuthRespositoryProvider).saveToken(token: success);
      ref
          .read(appNotifierProvider.notifier)
          .updateAppState(const AppState.authenticated());
      state = AsyncValue.data(success);
    });
  }
}
