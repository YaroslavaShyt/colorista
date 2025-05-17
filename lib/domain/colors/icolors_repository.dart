import 'package:colorista/domain/colors/app_color/iapp_color.dart';

abstract interface class IColorsRepository {
  Future<IAppColor?> getColorInfo(int r, int g, int b);
}
