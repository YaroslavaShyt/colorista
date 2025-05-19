import 'package:colorista/core/utils/string_extention.dart';
import 'package:colorista/domain/colors/app_color/iapp_color.dart';

part 'app_color_keys.dart';

/// Implementation of [IAppColor] model
class AppColor implements IAppColor {
  @override
  final int hexColor;
  @override
  final List<int> rgbColor;
  @override
  final String name;
  @override
  final List<(int, List<int>)> colorTriad;
  @override
  final List<int> complementaryColor;

  /// Required [hexColor], [rgbColor], [name],
  /// [colorTriad], [complementaryColor]
  AppColor({
    required this.hexColor,
    required this.rgbColor,
    required this.name,
    required this.colorTriad,
    required this.complementaryColor,
  });

  /// Parse json data and return [IAppColor] object
  factory AppColor.fromJson(Map<String, dynamic> data) {
    final String rgbString =
        (data[AppColorKeys.rgb] as Map)[AppColorKeys.value] as String;
    final List<int> rgb = rgbString.parseRGB();
    final int hex =
        ((data[AppColorKeys.hex] as Map)[AppColorKeys.value] as String)
            .parseHex();
    final String name =
        (data[AppColorKeys.name] as Map)[AppColorKeys.value] as String;

    return AppColor(
      hexColor: hex,
      rgbColor: rgb,
      name: name,
      colorTriad: [],
      complementaryColor: [],
    );
  }

  @override
  AppColor copyWith({
    int? hexColor,
    List<int>? rgbColor,
    String? name,
    List<(int, List<int>)>? colorTriad,
    List<int>? complementaryColor,
  }) {
    return AppColor(
      hexColor: hexColor ?? this.hexColor,
      rgbColor: rgbColor ?? this.rgbColor,
      name: name ?? this.name,
      colorTriad: colorTriad ?? this.colorTriad,
      complementaryColor: complementaryColor ?? this.complementaryColor,
    );
  }
}
