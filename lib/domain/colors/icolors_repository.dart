import 'package:colorista/domain/colors/app_color/iapp_color.dart';

/// Abstract interface for ColorsRepository
abstract interface class IColorsRepository {
  /// Fetches color information based on RGB values.
  /// Takes red [r], green [g], and blue [b] components as integers
  Future<IAppColor?> getColorInfo(int r, int g, int b);
}
