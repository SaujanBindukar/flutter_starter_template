import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/core/app/infrastructure/app_state.dart';
import 'package:flutter_starter_template/core/app/application/app_controller.dart';
import 'package:flutter_starter_template/feature/auth/infrastructure/repository/auth_repository_provider.dart';

class RequestInterceptors extends InterceptorsWrapper {
  Ref ref;
  RequestInterceptors({
    required this.ref,
  });
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final _dio = ref.read(dioProvider);
    final tokenRequired = options.extra['tokenRequired'] as bool;

    if (tokenRequired) {
      final tokenResponse = await ref.read(authRepositoryProvider).getToken();
      tokenResponse.fold(
        (failure) {
          ref.read(appNotifierProvider.notifier).updateAppState(
                const AppState.unAuthenticated(isSignIn: true),
              );
        },
        (token) {
          options.headers['Authorization'] = 'Bearer $token';
        },
      );
    }
    super.onRequest(options, handler);
  }
}
