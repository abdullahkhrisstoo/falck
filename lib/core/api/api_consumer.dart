import 'package:falack_app/core/dto/api_response.dart';

abstract class ApiConsumer<T> {
  Future<ApiResponse<T>> get(String path, {Map<String, dynamic>? queryParameters,  });

  Future<ApiResponse<T>> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  });

  Future<ApiResponse<T>> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,

  });

  Future<ApiResponse<T>> delete(String path, {Map<String, dynamic>? queryParameters,});
}


