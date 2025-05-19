import 'package:colorista/core/utils/list_extention.dart';
import 'package:colorista/presentation/home/widgets/color_container_widget.dart';
import 'package:flutter/material.dart';

/// Widget to display triad as a [Row] of [Container]
class ColorTriadWidget extends StatelessWidget {
  /// Required [color1], [color2], [color3]
  /// [complementary] to display text
  const ColorTriadWidget({
    required this.color1,
    required this.color2,
    required this.color3,
    required this.complementary,
    super.key,
  });

  /// First complementary color
  final int color1;

  /// Second complementary color
  final int color2;

  /// Third complementary color
  final int color3;

  /// Complementary color
  final List<int>? complementary;

  /// Convert complementary color to RGB-Color
  Color get complementaryColor => complementary?.toColor() ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(10),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Color triad"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ColorContainerWidget(
                color: Color(color1),
                complementaryColor: complementaryColor,
              ),
              ColorContainerWidget(
                color: Color(color2),
                complementaryColor: complementaryColor,
              ),
              ColorContainerWidget(
                color: Color(color3),
                complementaryColor: complementaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
