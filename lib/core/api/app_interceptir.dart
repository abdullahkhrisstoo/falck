import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:falack_app/core/cache/cache_helper.dart';

class AppIntercepters extends Interceptor {
  Future<String?> _getAuthToken() async {
    return await CacheHelper.getData(key: CacheHelper.USER_DATA_KEY);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');

    options.headers["Content-Type"] = "application/json";
    options.headers["Accept"] = "application/json";

    final authToken = await _getAuthToken();
    if (authToken != null) {
      options.headers["Authorization"] = "Bearer $authToken";
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
