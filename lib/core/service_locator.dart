import 'package:colorista/data/colors/colors_repository.dart';
import 'package:colorista/data/networking/dio_configuration.dart';
import 'package:colorista/data/networking/dio_network_client.dart';
import 'package:colorista/data/services/colors_service.dart';
import 'package:colorista/domain/colors/icolors_repository.dart';
import 'package:colorista/domain/networking/inetwork_client.dart';
import 'package:colorista/domain/services/icolors_service.dart';
import 'package:get_it/get_it.dart';

/// GetIt for dependency injection
final GetIt sl = GetIt.instance;

/// ServiceLocator class. Registering dependencies
class ServiceLocator {
  /// Entry method to initialize all dependencies
  void init() {
    _initNetworking();
    _initServices();
  }

  /// Networking-related dependencies
  /// [DioNetworkClient] as a default client to work with networking in repos
  /// [ColorsRepository] fetches info about requested color
  void _initNetworking() {
    final INetworkClient networkClient = DioNetworkClient(
      config: DioConfiguration(),
    );

    sl.registerSingleton<INetworkClient>(networkClient);

    sl.registerFactory<IColorsRepository>(
      () => ColorsRepository(networkClient: networkClient),
    );
  }

  /// Service-related dependencies
  /// [ColorsService] responsible for generating color data
  void _initServices() {
    sl.registerFactory<IColorsService>(
      () => ColorsService(
        colorsRepository: sl.get<IColorsRepository>(),
      ),
    );
  }
}
