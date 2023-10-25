import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter_template/core/app_setup/dio/interceptors/error_interceptors.dart';
import 'package:flutter_starter_template/core/app_setup/dio/interceptors/request_interceptors.dart';
import 'package:flutter_starter_template/core/app_setup/dio/interceptors/response_interceptors.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_client.g.dart';

@riverpod
String baseUrl(Ref ref) {
  final apiIP = dotenv.env['API_IP'];
  return 'http://$apiIP:3000';
}

@riverpod
Dio dio(Ref ref) {
  final dio = Dio();
  final baseUrl = ref.read(baseUrlProvider);
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = const Duration(seconds: 30);
  dio.options.receiveTimeout = const Duration(seconds: 30);
  dio.options.contentType = Headers.jsonContentType;
  dio.options.headers = <String, dynamic>{
    'Accept': Headers.jsonContentType,
  };
  dio.options.extra = <String, Object>{
    'tokenRequired': true,
  };
  dio.interceptors.addAll([
    LogInterceptor(),
    RequestInterceptors(ref: ref),
    ResponseInterceptors(),
    ErrorInterceptors(),
  ]);

  return dio;
}
