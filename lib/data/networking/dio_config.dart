import 'package:colorista/data/networking/endpoints.dart';
import 'package:colorista/domain/networking/inetwork_client_config.dart';
import 'package:dio/dio.dart';

class DioConfiguration implements INetworkClientConfig {
  @override
  BaseOptions get configuration {
    return BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      contentType: 'application/json',
      baseUrl: Endpoints.baseEndpoint,
    );
  }
}
