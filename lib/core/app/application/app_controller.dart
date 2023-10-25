import 'package:flutter_starter_template/core/app/app_state.dart';
import 'package:flutter_starter_template/feature/auth/infrastructure/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_controller.g.dart';

@riverpod
class AppNotifier extends _$AppNotifier {
  @override
  FutureOr<AppState> build() async {
    state = const AsyncData(AppState.started());
    await Future.delayed(const Duration(seconds: 2));
    return _appStarted();
  }

  Future<AppState> _appStarted() async {
    final token = await ref.read(authRepositoryProvider).getToken();
    return token.fold(
      (failure) => const AppState.unAuthenticated(),
      (token) => const AppState.authenticated(),
    );
  }

  Future<void> updateAppState(AppState appState) async {
    state = AsyncData(appState);
  }
}
