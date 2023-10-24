import 'package:flutter/material.dart';
import 'package:flutter_starter_template/core/app_setup/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';

sealed class IAuthRepository {
  Future<Either<Failure, String>> getToken();
  Future<void> saveToken({required String token});
}

class AuthRepository implements IAuthRepository {
  @override
  Future<Either<Failure, String>> getToken() async {
    try {
      final tokenBox = await Hive.openLazyBox('tokenBox');
      if (tokenBox.isEmpty) return Left(Failure());
      final token = await tokenBox.get('token');
      return Right(token);
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<void> saveToken({required String token}) async {
    try {
      final tokenBox = await Hive.openLazyBox('tokenBox');
      await tokenBox.put('token', token);
    } catch (e) {
      debugPrint('$e');
    }
  }
}
