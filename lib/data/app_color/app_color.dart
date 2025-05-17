import 'package:colorista/domain/app_color/iapp_color.dart';

class AppColor implements IAppColor {
  AppColor({
    required this.colorNumber,
  });

  @override
  final int colorNumber;
}
