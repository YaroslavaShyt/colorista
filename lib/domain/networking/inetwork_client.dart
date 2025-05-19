/// Abstract interface to define networking methods
abstract interface class INetworkClient {
  /// Sends a GET request to the given [endpoint].
  /// [queryParameters] - Optional parameters to include in the request URL
  /// [data] - Optional data (not usually used with GET)
  /// [additionalParam] - Extra parameters
  Future<dynamic> get({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Object? data,
    dynamic additionalParam,
  });

  /// Sends a POST request to the given [endpoint]
  Future<dynamic> post({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Object? data,
    dynamic additionalParam,
  });

  /// Sends a PUT request to the given [endpoint]
  Future<dynamic> put({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Object? data,
    dynamic additionalParam,
  });

  /// Sends a DELETE request to the given [endpoint]
  Future<dynamic> delete({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Object? data,
    dynamic additionalParam,
  });

  /// Sends a PATCH request to the given [endpoint]
  Future<dynamic> patch({
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Object? data,
    dynamic additionalParam,
  });
}
