import 'package:dio/dio.dart';

class RequestInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    // TODO: check if the token is required
    // TODO: if token is required then add it on the header else normal request
    super.onRequest(options, handler);
  }
}
