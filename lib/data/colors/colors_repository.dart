import 'package:colorista/core/logger.dart';
import 'package:colorista/data/colors/app_color/app_color.dart';
import 'package:colorista/data/networking/endpoints.dart';
import 'package:colorista/domain/colors/app_color/iapp_color.dart';
import 'package:colorista/domain/colors/icolors_repository.dart';
import 'package:colorista/domain/networking/inetwork_client.dart';
import 'package:dio/dio.dart';

/// Repository to fetch info about colors
class ColorsRepository implements IColorsRepository {
  final INetworkClient _networkClient;

  /// Required [INetworkClient]
  ColorsRepository({
    required INetworkClient networkClient,
  }) : _networkClient = networkClient;

  @override
  Future<IAppColor?> getColorInfo(int r, int g, int b) async {
    try {
      final Response<dynamic>? response = await _networkClient.get(
        endpoint: Endpoints.colorEndpoint,
        queryParameters: {'rgb': '$r,$g,$b'},
      ) as Response<dynamic>?;

      if (response == null) return null;

      return AppColor.fromJson(response.data as Map<String, dynamic>);
    } catch (error) {
      logger.e(error);
    }

    return null;
  }
}
