import 'package:colorista/domain/colors/app_color/iapp_color.dart';

/// Abstract interface to define a color generation service
abstract interface class IColorsService {
  /// Generate color and fetch additional data
  Future<IAppColor> generateColor();
}
