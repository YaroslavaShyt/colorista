import 'dart:math';

import 'package:colorista/core/constants/color_constants.dart';
import 'package:colorista/data/colors/app_color/app_color.dart';
import 'package:colorista/domain/colors/app_color/iapp_color.dart';
import 'package:colorista/domain/colors/icolors_repository.dart';
import 'package:colorista/domain/services/icolors_service.dart';

class ColorsService implements IColorService {
  ColorsService({
    required IColorsRepository colorsRepository,
  }) : _colorsRepository = colorsRepository;

  final IColorsRepository _colorsRepository;

  @override
  Future<IAppColor> generateColor() async {
    final (int, List<int>) colorData = _generateColor();

    final int red = colorData.$2[0];
    final int green = colorData.$2[1];
    final int blue = colorData.$2[2];

    final List<(int, List<int>)> colorTriad =
        _generateTriadColors(colorData.$1);
    final List<int> complementaryColor =
        _getComplementaryRgb([red, green, blue]);

    final IAppColor? appColor =
        await _colorsRepository.getColorInfo(red, green, blue);

    if (appColor == null) {
      return AppColor(
        hexColor: colorData.$1,
        rgbColor: colorData.$2,
        name: '',
        colorTriad: colorTriad,
        complementaryColor: complementaryColor,
      );
    }

    return appColor.copyWith(
      colorTriad: colorTriad,
      complementaryColor: complementaryColor,
    );
  }

  (int, List<int>) _generateColor() {
    final Random random = Random();

    final int red = random.nextInt(ColorConstants.redMaxValue);
    final int green = random.nextInt(ColorConstants.greenMaxValue);
    final int blue = random.nextInt(ColorConstants.blueMaxValue);

    final int redPart = red << ColorConstants.redBitShifts;
    final int greenPart = green << ColorConstants.greenBitShifts;

    final int fullColor =
        ColorConstants.alphaChannel | redPart | greenPart | blue;

    return (fullColor, [red, green, blue]);
  }

  List<(int, List<int>)> _generateTriadColors(int baseColor) {
    final int red = (baseColor >> 16) & 0xFF;
    final int green = (baseColor >> 8) & 0xFF;
    final int blue = baseColor & 0xFF;

    final hsl = _rgbToHsl(red, green, blue);

    final h1 = (hsl[0] + 120) % 360;
    final h2 = (hsl[0] + 240) % 360;

    final rgb1 = _hslToRgb(h1, hsl[1], hsl[2]);
    final rgb2 = _hslToRgb(h2, hsl[1], hsl[2]);

    return [
      _rgbToFullColor(rgb1),
      _rgbToFullColor(rgb2),
    ];
  }

  List<double> _rgbToHsl(int r, int g, int b) {
    final double rNorm = r / 255;
    final double gNorm = g / 255;
    final double bNorm = b / 255;

    final double maxValue = [rNorm, gNorm, bNorm].reduce(max);
    final double minValue = [rNorm, gNorm, bNorm].reduce(min);
    double h = 0, s = 0;
    final double l = (maxValue + minValue) / 2;

    if (maxValue != minValue) {
      final double d = maxValue - minValue;
      s = l > 0.5 ? d / (2 - maxValue - minValue) : d / (maxValue + minValue);

      if (maxValue == rNorm) {
        h = (gNorm - bNorm) / d + (gNorm < bNorm ? 6 : 0);
      } else if (maxValue == gNorm) {
        h = (bNorm - rNorm) / d + 2;
      } else {
        h = (rNorm - gNorm) / d + 4;
      }

      h *= 60;
    }

    return [h, s, l];
  }

  List<int> _hslToRgb(double h, double s, double l) {
    double r, g, b;

    if (s == 0) {
      r = g = b = l;
    } else {
      double hueToRgb(double p, double q, double tRaw) {
        double t = tRaw;
        if (t < 0) t += 1;
        if (t > 1) t -= 1;
        if (t < 1 / 6) return p + (q - p) * 6 * t;
        if (t < 1 / 2) return q;
        if (t < 2 / 3) return p + (q - p) * (2 / 3 - t) * 6;
        return p;
      }

      final q = l < 0.5 ? l * (1 + s) : l + s - l * s;
      final p = 2 * l - q;
      final hK = h / 360;

      r = hueToRgb(p, q, hK + 1 / 3);
      g = hueToRgb(p, q, hK);
      b = hueToRgb(p, q, hK - 1 / 3);
    }

    return [(r * 255).round(), (g * 255).round(), (b * 255).round()];
  }

  (int, List<int>) _rgbToFullColor(List<int> rgb) {
    final int r = rgb[0];
    final int g = rgb[1];
    final int b = rgb[2];

    final int redPart = r << ColorConstants.redBitShifts;
    final int greenPart = g << ColorConstants.greenBitShifts;
    final int fullColor = ColorConstants.alphaChannel | redPart | greenPart | b;

    return (fullColor, [r, g, b]);
  }

  List<int> _getComplementaryRgb(List<int> rgb) {
    final r = 255 - rgb[0];
    final g = 255 - rgb[1];
    final b = 255 - rgb[2];

    return [r, g, b];
  }
}
