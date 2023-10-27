import 'package:flutter_starter_template/core/app/application/app_controller.dart';
import 'package:flutter_starter_template/core/app/infrastructure/app_state.dart';
import 'package:flutter_starter_template/feature/auth/infrastructure/repository/auth_repository.dart';
import 'package:flutter_starter_template/feature/auth/infrastructure/repository/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  late IAuthRepository authRepository;
  @override
  FutureOr<void> build() {
    authRepository = ref.read(authRepositoryProvider);
  }

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    String? address,
  }) async {
    state = const AsyncValue.loading();
    final response = await authRepository.singup(
      email: email,
      password: password,
      name: name,
      address: address,
    );
    response.fold((failure) {
      state = AsyncValue.error(
        failure.reason,
        StackTrace.current,
      );
    }, (success) {
      //navigate to homescreen after register success
      ref.read(appNotifierProvider.notifier).updateAppState(
            const AppState.authenticated(),
          );
      state = AsyncValue.data(success);
    });
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    final response = await authRepository.login(
      email: email,
      password: password,
    );

    response.fold((failure) {
      state = AsyncValue.error(
        failure.reason,
        StackTrace.current,
      );
    }, (success) async {
      await authRepository.saveToken(token: success);
      ref
          .read(appNotifierProvider.notifier)
          .updateAppState(const AppState.authenticated());
      state = AsyncValue.data(success);
    });
  }
}
