import 'package:flutter/material.dart';

/// Widget to display color property
class ColorPropertyWidget extends StatelessWidget {
  /// Required [propertyName], [propertyValue]
  const ColorPropertyWidget({
    required this.propertyName,
    required this.propertyValue,
    this.fontSize = 30,
    this.textColor,
    super.key,
  });

  /// Property name
  final String propertyName;

  /// Property value
  final String propertyValue;

  /// Font size (optional)
  final double fontSize;

  /// Text color (optional)
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: fontSize,
            color: textColor ?? Colors.black,
          ),
          children: [
            TextSpan(
              text: "$propertyName: ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: propertyValue,
            ),
          ],
        ),
      ),
    );
  }
}
