import 'package:colorista/domain/colors/app_color/iapp_color.dart';

abstract interface class IColorService {
  Future<IAppColor> generateColor();
}
