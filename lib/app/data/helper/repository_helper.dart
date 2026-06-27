import 'package:dio/dio.dart';
import 'package:flutter_rconnect/app/common/config/dio_exception.dart';
import 'package:flutter_rconnect/app/data/services/api_service.dart';
import 'package:fpdart/fpdart.dart';

abstract class RepositoryHelper {
  final api = ApiService();

  Future<Either<String, T>> callApi<T>({
    required Future<Response> api,
    T Function(dynamic json)? jsonCallback, // Callback opsional
  }) async {
    try {
      Response response = await api;

      // Periksa statusCode
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data;
        print(data);

        if (data != null) {
          if (jsonCallback != null) {
            // Jika jsonCallback diberikan, proses data
            try {
              return right(jsonCallback(data));
            } catch (e) {
              return left(
                "Terjadi kesalahan saat memproses data: ${e.toString()}",
              );
            }
          } else {
            // Jika jsonCallback tidak diberikan, return bool
            return right(true as T);
          }
        } else if (data == null && jsonCallback == null) {
          return right(true as T);
        } else {
          final message = response.data['message'] ?? 'Data tidak ditemukan';
          return left(message);
        }
      } else {
        final message =
            response.data['message'] ??
            'Terjadi kesalahan pada server dengan status: ${response.statusCode}';
        return left(message);
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return left(errorMessage);
    }
  }

  Future<Either<String, T>> callApiWithData<T>({
    required Future<Response> api,
    T Function(dynamic json)? jsonCallback,
  }) async {
    try {
      Response response = await api;
      // Periksa statusCode
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['data'];

        if (data != null) {
          if (jsonCallback != null) {
            // Jika jsonCallback diberikan, proses data
            try {
              return right(jsonCallback(data));
            } catch (e) {
              return left(
                "Terjadi kesalahan saat memproses data: ${e.toString()}",
              );
            }
          } else {
            // Jika jsonCallback tidak diberikan, return bool
            return right(true as T);
          }
        } else if (data == null && jsonCallback == null) {
          return right(true as T);
        } else {
          final message = response.data['message'] ?? 'Data tidak ditemukan';
          return left(message);
        }
      } else {
        final message =
            response.data['message'] ??
            'Terjadi kesalahan pada server dengan status: ${response.statusCode}';
        return left(message);
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return left(errorMessage);
    }
  }

  Future<Either<String, List<T>>> callApiWithListData<T>({
    required Future<Response> api,
    required T Function(dynamic json) jsonCallback,
  }) async {
    try {
      Response response = await api;
      // Periksa statusCode
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.data['articles'];

        if (data != null && data is List) {
          try {
            final dataList = data.map((item) => jsonCallback(item)).toList();
            return right(dataList);
          } catch (e) {
            return left(
              "Terjadi kesalahan saat memproses data list: ${e.toString()}",
            );
          }
        } else {
          return left('Format data tidak valid: Data tidak berupa list');
        }
      } else {
        final message =
            response.data['message'] ??
            'Terjadi kesalahan pada server dengan status: ${response.statusCode}';
        return left(message);
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return left(errorMessage);
    }
  }
}
