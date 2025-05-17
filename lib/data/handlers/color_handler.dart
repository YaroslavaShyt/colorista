import 'dart:math';

import 'package:colorista/core/constants/color_constants.dart';
import 'package:colorista/domain/handlers/icolor_handler.dart';

class ColorHandler implements IColorHandler {
  @override
  int generateColor() {
    final Random random = Random();

    final int red = random.nextInt(ColorConstants.redMaxValue);
    final int green = random.nextInt(ColorConstants.greenMaxValue);
    final int blue = random.nextInt(ColorConstants.blueMaxValue);

    final int redPart = red << ColorConstants.redBitShifts;
    final int greenPart = green << ColorConstants.greenBitShifts;

    final int fullColor =
        ColorConstants.alphaChannel | redPart | greenPart | blue;

    return fullColor;
  }
}
