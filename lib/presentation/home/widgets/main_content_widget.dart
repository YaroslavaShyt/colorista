import 'package:colorista/presentation/home/bloc/home_state.dart';
import 'package:colorista/presentation/home/widgets/color_info_widget.dart';
import 'package:colorista/presentation/home/widgets/color_triad_widget.dart';
import 'package:colorista/presentation/home/widgets/hello_there_widget.dart';
import 'package:flutter/material.dart';

class MainContentWidget extends StatelessWidget {
  const MainContentWidget({
    required this.state,
    super.key,
  });

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const HelloThereWidget(),
        ColorInfoWidget(
          colorName: state.color?.name ?? '',
          complementary: state.color?.complementaryColor,
          hex: state.color?.hexColor.toString() ?? '',
          rgb: state.color?.rgbColor.toString() ?? '',
        ),
        ColorTriadWidget(
          complementary: state.color?.complementaryColor ?? [],
          color1: state.color?.colorTriad[0].$1 ?? 0xffffff,
          color2: state.color?.colorTriad[1].$1 ?? 0xffffff,
          color3: state.color?.hexColor ?? 0xffffff,
        )
      ],
    );
  }
}
