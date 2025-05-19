import 'package:colorista/core/constants/color_constants.dart';
import 'package:colorista/domain/colors/app_color/iapp_color.dart';
import 'package:colorista/presentation/home/widgets/color_info_widget.dart';
import 'package:colorista/presentation/home/widgets/color_triad_widget.dart';
import 'package:colorista/presentation/home/widgets/hello_there_widget.dart';
import 'package:flutter/material.dart';

/// Widget to display color info
class MainContentWidget extends StatelessWidget {
  /// Required [color]
  const MainContentWidget({
    required this.color,
    super.key,
  });

  /// Required [color]
  final IAppColor? color;

  /// Color name
  String get colorName => color?.name ?? '';

  /// Color hex representation
  String get hexValue => color?.hexColor.toString() ?? '';

  /// Color rgb representation
  String get rgbValue => color?.rgbColor.toString() ?? '';

  /// Complementary colors
  List<int> get complementaryColors => color?.complementaryColor ?? [0, 0, 0];

  /// First color of the triad
  int get firstTriadColor =>
      color?.colorTriad.first.$1 ?? ColorConstants.defaultHexColor;

  /// Second color of the triad
  int get secondTriadColor =>
      color?.colorTriad[1].$1 ?? ColorConstants.defaultHexColor;

  /// Third color of the triad
  int get thirdTriadColor => color?.hexColor ?? ColorConstants.defaultHexColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const HelloThereWidget(),
        ColorInfoWidget(
          colorName: colorName,
          complementary: complementaryColors,
          hex: hexValue,
          rgb: rgbValue,
        ),
        ColorTriadWidget(
          complementary: complementaryColors,
          color1: firstTriadColor,
          color2: secondTriadColor,
          color3: thirdTriadColor,
        ),
      ],
    );
  }
}
