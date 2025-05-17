import 'package:colorista/presentation/home/widgets/color_container_widget.dart';
import 'package:flutter/material.dart';

class ColorTriadWidget extends StatelessWidget {
  const ColorTriadWidget({
    required this.color1,
    required this.color2,
    required this.color3,
    required this.complementary,
    super.key,
  });

  final int color1;
  final int color2;
  final int color3;
  final List<int> complementary;

  @override
  Widget build(BuildContext context) {
    final Color color = complementary != null
        ? Color.fromRGBO(
            complementary![0], complementary![1], complementary![2], 1)
        : Colors.white;

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
                color: color1,
                complementaryColor: color,
              ),
              ColorContainerWidget(
                color: color2,
                complementaryColor: color,
              ),
              ColorContainerWidget(
                color: color3,
                complementaryColor: color,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
