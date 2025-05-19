import 'package:colorista/core/utils/list_extention.dart';
import 'package:colorista/presentation/home/widgets/color_container_widget.dart';
import 'package:colorista/presentation/home/widgets/color_property_widget.dart';
import 'package:flutter/material.dart';

/// Widget to display color properties
class ColorInfoWidget extends StatelessWidget {
  /// Color name
  final String colorName;

  /// Hex representation of color
  final String hex;

  /// List of complementary colors
  final List<int>? complementary;

  /// Red-Green-Blue representation of the color
  final String rgb;

  /// Convert [List] rgb to [Color]
  Color get complementaryColor => complementary?.toColor() ?? Colors.black;

  /// Required [colorName], [hex], [complementary], [rgb]
  const ColorInfoWidget({
    required this.colorName,
    required this.hex,
    required this.complementary,
    required this.rgb,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColorPropertyWidget(
                propertyName: 'Name',
                propertyValue: colorName,
                textColor: complementary?.toColor(),
              ),
              ColorPropertyWidget(
                propertyName: 'hex',
                propertyValue: hex,
                fontSize: 20,
                textColor: complementary?.toColor(),
              ),
              ColorPropertyWidget(
                propertyName: 'rgb',
                propertyValue: rgb,
                fontSize: 20,
                textColor: complementary?.toColor(),
              ),
            ],
          ),
        ),
        Flexible(
          child: Column(
            spacing: 6,
            children: [
              Text(
                "Complementary",
                style: TextStyle(
                  color: complementaryColor,
                  fontSize: 10,
                ),
              ),
              ColorContainerWidget(
                color: complementaryColor,
                complementaryColor:
                    Color(hex.isNotEmpty ? int.parse(hex) : 0xffffff),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
