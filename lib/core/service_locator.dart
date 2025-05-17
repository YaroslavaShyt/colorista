import 'package:colorista/data/colors/colors_repository.dart';
import 'package:colorista/data/networking/dio_config.dart';
import 'package:colorista/data/networking/dio_network_client.dart';
import 'package:colorista/data/services/colors_service.dart';
import 'package:colorista/domain/colors/icolors_repository.dart';
import 'package:colorista/domain/networking/inetworking_client.dart';
import 'package:colorista/domain/services/icolors_service.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

class ServiceLocator {
  void init() {
    _initNetworking();
    _initServices();
  }

  void _initNetworking() {
    final INetworkClient networkClient = DioNetworkClient();
    sl.registerSingleton<INetworkClient>(networkClient).init(
          config: DioConfiguration(),
        );

    sl.registerFactory<IColorsRepository>(
      () => ColorsRepository(networkClient: networkClient),
    );
  }

  void _initServices() {
    sl.registerFactory<IColorService>(
      () => ColorsService(
        colorsRepository: sl.get<IColorsRepository>(),
      ),
    );
  }
}
