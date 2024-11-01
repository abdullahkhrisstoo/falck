import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:falack_app/core/api/app_interceptir.dart';
import 'package:falack_app/core/dto/api_response.dart';
import 'package:falack_app/core/api/api_consumer.dart';
import 'package:falack_app/core/utils/constant/api_constant.dart';
import 'package:falack_app/core/error/exceptions.dart';
import 'package:falack_app/core/api/status_code.dart';
import 'package:falack_app/injection_container.dart' as di;

class DioConsumer<T> implements ApiConsumer<T> {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.json
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
    client.interceptors.add(di.sl<AppIntercepters>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }

  @override
  Future<ApiResponse<T>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      final responseJson = _handleResponseAsJson(response);
      return ApiResponse<T>.fromJson(responseJson, (json) => json as T);
    } on DioException catch (error) {
      _handleDioError(error);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<T>> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await client.post(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      final responseJson = _handleResponseAsJson(response);
      return ApiResponse<T>.fromJson(responseJson, (json) => json as T);
    } on DioException catch (error) {
      _handleDioError(error);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<T>> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await client.put(
        path,
        queryParameters: queryParameters,
        data: body,
      );
      final responseJson = _handleResponseAsJson(response);
      return ApiResponse<T>.fromJson(responseJson, (json) => json as T);
    } on DioException catch (error) {
      _handleDioError(error);
      rethrow;
    }
  }

  @override
  Future<ApiResponse<T>> delete(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.delete(path, queryParameters: queryParameters);
      final responseJson = _handleResponseAsJson(response);
      return ApiResponse<T>.fromJson(responseJson, (json) => json as T);
    } on DioException catch (error) {
      _handleDioError(error);
      rethrow;
    }
  }

  dynamic _handleResponseAsJson(Response<dynamic> response) {
    if (response.data is String) {
      return jsonDecode(response.data as String);
    }
    return response.data;
  }

  void _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw const FetchDataException();
      case DioExceptionType.cancel:
        throw const FetchDataException();
      case DioExceptionType.unknown:
        throw const NoInternetConnectionException();
      case DioExceptionType.badCertificate:
        throw const BadRequestException();
      case DioExceptionType.badResponse:
        throw const BadRequestException();
      case DioExceptionType.connectionError:
        throw const BadRequestException();
    }
  }
}
