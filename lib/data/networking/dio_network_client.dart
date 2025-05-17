import 'dart:async';

import 'package:colorista/domain/networking/inetwork_client_config.dart';
import 'package:colorista/domain/networking/inetworking_client.dart';
import 'package:dio/dio.dart';

class DioNetworkClient implements INetworkClient {
  late final Dio _dio;

  @override
  void init({required INetworkClientConfig config}) {
    _dio = Dio(config.configuration as BaseOptions?);

    _dio.transformer = BackgroundTransformer();
  }

  @override
  Future<Response<dynamic>?> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Object? data,
    dynamic additionalParam,
    Options? options,
  }) async {
    try {
      final Response<dynamic> response = await _dio.get(
        endpoint,
        queryParameters: queryParameters,
        data: data,
        options: options,
      );

      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response<dynamic>?> delete({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Object? data,
    dynamic additionalParam,
    Options? options,
  }) async {
    try {
      final Response<dynamic> response = await _dio.delete(
        endpoint,
        queryParameters: queryParameters,
        data: data,
        options: options,
      );

      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response<dynamic>?> patch({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Object? data,
    dynamic additionalParam,
    Options? options,
  }) async {
    try {
      final Response<dynamic> response = await _dio.patch(
        endpoint,
        queryParameters: queryParameters,
        data: data,
        options: options,
      );

      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response<dynamic>?> post({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Object? data,
    dynamic additionalParam,
    Options? options,
  }) async {
    try {
      final Response<dynamic> response = await _dio.post(
        endpoint,
        queryParameters: queryParameters,
        data: data,
        options: options,
      );

      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response<dynamic>?> put({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Object? data,
    dynamic additionalParam,
    Options? options,
  }) async {
    try {
      final Response<dynamic> response = await _dio.put(
        endpoint,
        queryParameters: queryParameters,
        data: data,
        options: options,
      );

      return response;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
