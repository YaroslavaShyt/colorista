import 'package:flutter/material.dart';

class ColorPropertyWidget extends StatelessWidget {
  const ColorPropertyWidget({
    required this.propertyName,
    required this.propertyValue,
    this.fontSize = 30,
    this.textColor,
    super.key,
  });

  final String propertyName;
  final String propertyValue;
  final double fontSize;
  final List<int>? textColor;

  @override
  Widget build(BuildContext context) {
    final Color? color = textColor != null
        ? Color.fromRGBO(textColor![0], textColor![1], textColor![2], 1)
        : null;

    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            fontSize: fontSize,
            color: color ?? Colors.black,
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
