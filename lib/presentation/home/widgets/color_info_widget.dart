import 'package:colorista/presentation/home/widgets/color_property_widget.dart';
import 'package:flutter/material.dart';

class ColorInfoWidget extends StatelessWidget {
  const ColorInfoWidget({
    required this.colorName,
    required this.hex,
    required this.complementary,
    required this.rgb,
    super.key,
  });

  final String colorName;
  final String hex;
  final List<int>? complementary;
  final String rgb;

  @override
  Widget build(BuildContext context) {
    final Color? color = complementary != null
        ? Color.fromRGBO(
            complementary![0], complementary![1], complementary![2], 1)
        : null;

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
                textColor: complementary,
              ),
              ColorPropertyWidget(
                propertyName: 'hex',
                propertyValue: hex,
                fontSize: 20,
                textColor: complementary,
              ),
              ColorPropertyWidget(
                propertyName: 'rgb',
                propertyValue: rgb,
                fontSize: 20,
                textColor: complementary,
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
                  color: color,
                  fontSize: 10,
                ),
              ),
              Container(
                height: 100,
                width: 100,
                color: color,
              ),
            ],
          ),
        )
      ],
    );
  }
}
