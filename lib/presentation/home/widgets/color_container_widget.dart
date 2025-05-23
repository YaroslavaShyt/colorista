import 'package:flutter/material.dart';

/// Widget to display generated color as a square
class ColorContainerWidget extends StatelessWidget {
  /// Container color
  final Color color;

  /// Complementary color to display text
  final Color complementaryColor;

  /// Required [color] and [complementaryColor]
  const ColorContainerWidget({
    required this.color,
    required this.complementaryColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double width = (MediaQuery.sizeOf(context).width / 3) - 20;

    return Container(
      height: 200,
      width: width,
      color: color,
      child: Center(
        child: Text(
          color.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: complementaryColor,
          ),
        ),
      ),
    );
  }
}
