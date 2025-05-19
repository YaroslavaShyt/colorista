import 'dart:async';

import 'package:colorista/domain/networking/inetwork_client.dart';
import 'package:colorista/domain/networking/inetwork_client_config.dart';
import 'package:dio/dio.dart';

/// [Dio] network client implementation
class DioNetworkClient implements INetworkClient {
  final Dio _dio;

  /// Initializes the networking client with the given configuration
  /// The [config] parameter contains setup details (base URL, headers, etc)
  DioNetworkClient({
    required INetworkClientConfig config,
  }) : _dio = Dio(config.configuration as BaseOptions?) {
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
