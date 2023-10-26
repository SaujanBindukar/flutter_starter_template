import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/core/app_setup/dio/dio_client.dart';
import 'package:flutter_starter_template/core/app_setup/failure.dart';
import 'package:flutter_starter_template/core/app_setup/hive/hive_box.dart';
import 'package:flutter_starter_template/core/services/app_endpoint.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';

final iAuthRespositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRepository(ref: ref);
});

sealed class IAuthRepository {
  Future<Either<Failure, String>> getToken();
  Future<void> saveToken({required String token});

  Future<Either<Failure, String>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, String>> singup({
    required String email,
    required String password,
    required String name,
    String? address,
  });
}

class AuthRepository implements IAuthRepository {
  Ref ref;
  AuthRepository({
    required this.ref,
  });

  Dio get _dio => ref.read(dioProvider);
  @override
  Future<Either<Failure, String>> getToken() async {
    try {
      final tokenBox = await Hive.openLazyBox(HiveBox.tokenBox);
      if (tokenBox.isEmpty) {
        return Left(Failure('Hive Error', FailureType.unknown));
      }
      final token = await tokenBox.get('token');
      return Right(token);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<void> saveToken({required String token}) async {
    try {
      final tokenBox = await Hive.openLazyBox(HiveBox.tokenBox);
      await tokenBox.put('token', token);
    } catch (e) {
      debugPrint('$e');
    }
  }

  @override
  Future<Either<Failure, String>> login(
      {required String email, required String password}) async {
    try {
      final body = {
        'email': email,
        'password': password,
      };
      final response = await _dio.post<Map<String, dynamic>>(
        AuthEP.login,
        data: body,
        options: Options(
          contentType: Headers.jsonContentType,
          extra: <String, bool>{'tokenRequired': false},
        ),
      );
      return Right(response.data!['token']);
    } on DioException catch (error) {
      return Left(error.toFailure);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, String>> singup({
    required String email,
    required String password,
    required String name,
    String? address,
  }) async {
    try {
      final body = {
        'email': email,
        'password': password,
        'name': name,
        if (address != null) 'address': address,
      };
      final response = await _dio.post<Map<String, dynamic>>(
        AuthEP.signup,
        data: body,
        options: Options(
          contentType: Headers.jsonContentType,
          extra: <String, bool>{'tokenRequired': false},
        ),
      );
      return Right(response.data!['token']);
    } on DioException catch (error) {
      return Left(error.toFailure);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
