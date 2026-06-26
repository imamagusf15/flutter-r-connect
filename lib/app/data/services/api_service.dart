import 'package:dio/dio.dart';
import 'package:flutter_rconnect/app/common/config/api_config.dart';
import 'package:flutter_rconnect/app/common/session/session.dart';
import 'package:flutter_rconnect/app/common/session/session_manager.dart';
import 'package:get/get.dart' hide Response;

class ApiService {
  final SessionManager _sessionManager = Get.find();

  late final Dio _dio =
      Dio(
          BaseOptions(
            baseUrl: ApiConfig.baseUrl,
            connectTimeout: ApiConfig.connectionTimeout,
            receiveTimeout: ApiConfig.receiveTimeout,
            sendTimeout: ApiConfig.sendTimeout,
          ),
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              final token = _sessionManager.read(SessionKey.token);
              if (token != null && token.isNotEmpty) {
                options.headers['Authorization'] = 'Bearer $token';
              }
            },
          ),
        );

  Future<Response<T>> getRequest<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final processedParams = queryParameters?.map(
        (key, value) => MapEntry(key, value ?? ''),
      );

      final response = await _dio.get<T>(url, queryParameters: processedParams);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> postRequest<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> patchRequest<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.patch<T>(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> putRequest<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.put<T>(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<T>> deleteRequest<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.delete<T>(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
