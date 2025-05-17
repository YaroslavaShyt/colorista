import 'package:flutter/material.dart';

class ColorContainerWidget extends StatelessWidget {
  const ColorContainerWidget({
    required this.color,
    required this.complementaryColor,
    super.key,
  });

  final int color;
  final Color complementaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Color(color),
      child: Center(
        child: Text(
          color.toString(),
          style: TextStyle(
            color: complementaryColor,
          ),
        ),
      ),
    );
  }
}
