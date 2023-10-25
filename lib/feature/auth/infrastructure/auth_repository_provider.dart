import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/feature/auth/infrastructure/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository_provider.g.dart';

@riverpod
IAuthRepository authRepository(Ref ref) {
  return AuthRepository(ref: ref);
}
