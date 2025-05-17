import 'package:colorista/domain/colors/app_color/iapp_color.dart';
import 'package:equatable/equatable.dart';

part 'app_color_keys.dart';

class AppColor extends Equatable implements IAppColor {
  AppColor({
    required this.hexColor,
    required this.rgbColor,
    required this.name,
    required this.colorTriad,
    required this.complementaryColor,
  });

  factory AppColor.fromJson(Map<String, dynamic> data) {
    final String rgbString =
        data[AppColorKeys.rgb][AppColorKeys.value] as String;
    final List<int> rgb = rgbString
        .replaceAll(RegExp(r'[^\d,]'), '')
        .split(',')
        .map(int.parse)
        .toList();

    return AppColor(
      hexColor: int.parse(
            (data[AppColorKeys.hex][AppColorKeys.value] as String)
                .replaceFirst('#', ''),
            radix: 16,
          ) +
          0xFF000000,
      rgbColor: rgb,
      name: data[AppColorKeys.name][AppColorKeys.value] as String,
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

  @override
  List<Object?> get props => [hexColor, rgbColor, name];
}
