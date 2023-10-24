import 'package:dio/dio.dart';

class ErrorInterceptors extends InterceptorsWrapper {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      //TODO: logout user from the app
    }
    super.onError(err, handler);
  }
}
