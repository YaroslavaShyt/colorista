import 'package:colorista/data/handlers/color_handler.dart';
import 'package:colorista/domain/handlers/icolor_handler.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

class ServiceLocator {
  void init() {
    _initHandlers();
  }

  void _initHandlers() {
    sl.registerFactory<IColorHandler>(
      ColorHandler.new,
    );
  }
}
