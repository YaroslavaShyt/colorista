import 'dart:math';

import 'package:colorista/core/constants/color_constants.dart';
import 'package:colorista/data/colors/app_color/app_color.dart';
import 'package:colorista/domain/colors/app_color/iapp_color.dart';
import 'package:colorista/domain/colors/icolors_repository.dart';
import 'package:colorista/domain/services/icolors_service.dart';

/// Service for generating [IAppColor]
class ColorsService implements IColorsService {
  final IColorsRepository _colorsRepository;

  /// Required [IColorsRepository]
  ColorsService({
    required IColorsRepository colorsRepository,
  }) : _colorsRepository = colorsRepository;

  @override
  Future<IAppColor> generateColor() async {
    /// Generate random color
    final (int, List<int>) randomColor = _generateColor();

    final int red = randomColor.$2.first;
    final int green = randomColor.$2[1];
    final int blue = randomColor.$2[2];

    /// Generate color triad and complementary color for [randomColor]
    final List<(int, List<int>)> colorTriad = _generateTriadColors(
      randomColor.$1,
    );
    final List<int> complementaryColor = _getComplementaryRgb(
      [red, green, blue],
    );

    /// Fetch additional info for generated [randomColor]
    final IAppColor? appColor = await _colorsRepository.getColorInfo(
      red,
      green,
      blue,
    );

    if (appColor == null) {
      return AppColor(
        hexColor: randomColor.$1,
        rgbColor: randomColor.$2,
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

  /// Generates a random color and returns a tuple
  /// (fullColorHexInt, [red, green, blue])
  (int, List<int>) _generateColor() {
    final Random random = Random();

    /// Generate individual RGB components (0–255)
    final int red = random.nextInt(ColorConstants.redMaxValue);
    final int green = random.nextInt(ColorConstants.greenMaxValue);
    final int blue = random.nextInt(ColorConstants.blueMaxValue);

    /// Shift red and green bits to their positions in ARGB format
    final int redPart = red << ColorConstants.redBitShifts;
    final int greenPart = green << ColorConstants.greenBitShifts;

    /// Compose final 32-bit ARGB color
    final int fullColor =
        ColorConstants.alphaChannel | redPart | greenPart | blue;

    return (fullColor, [red, green, blue]);
  }

  List<(int, List<int>)> _generateTriadColors(int baseColor) {
    final int red = (baseColor >> 16) & 0xFF;
    final int green = (baseColor >> 8) & 0xFF;
    final int blue = baseColor & 0xFF;

    final hsl = _rgbToHsl(red, green, blue);

    final h1 = (hsl.first + 120) % 360;
    final h2 = (hsl.first + 240) % 360;

    final rgb1 = _hslToRgb(h1, hsl[1], hsl[2]);
    final rgb2 = _hslToRgb(h2, hsl[1], hsl[2]);

    return [
      _rgbToFullColor(rgb1),
      _rgbToFullColor(rgb2),
    ];
  }

  /// Converts RGB color values to HSL (Hue, Saturation, Lightness).
  /// RGB values must be in the range 0–255.
  /// Example: [H (0–360), S (0–1), L (0–1)].
  List<double> _rgbToHsl(int r, int g, int b) {
    /// Normalize RGB values to the [0.0, 1.0] range
    final double rNorm = r / ColorConstants.rgbMaxValue;
    final double gNorm = g / ColorConstants.rgbMaxValue;
    final double bNorm = b / ColorConstants.rgbMaxValue;

    /// Find the maximum and minimum of the normalized RGB values
    final double maxValue = [rNorm, gNorm, bNorm].reduce(max);
    final double minValue = [rNorm, gNorm, bNorm].reduce(min);

    /// Initialize hue [h] and saturation [s] to zero
    double h = 0;
    double s = 0;

    /// Calculate lightness [l]
    final double l = (maxValue + minValue) / 2;

    /// If the color is not a shade of gray
    if (maxValue != minValue) {
      final double d = maxValue - minValue;

      /// Calculate saturation
      s = l > ColorConstants.half

          /// lightness is > 0.5
          ? d / (2 - maxValue - minValue)

          /// lightness is <= 0.5
          : d / (maxValue + minValue);

      /// Calculate hue based on which RGB component is the max
      if (maxValue == rNorm) {
        /// Red is max
        h = (gNorm - bNorm) / d +
            (gNorm < bNorm
                ? ColorConstants.hueCompensation
                : ColorConstants.hueRedOffset);
      } else if (maxValue == gNorm) {
        /// Green is max
        h = (bNorm - rNorm) / d + ColorConstants.hueGreenOffset;
      } else {
        /// Blue is max
        h = (rNorm - gNorm) / d + ColorConstants.hueBlueOffset;
      }

      /// Convert hue to degrees (0–360)
      h *= ColorConstants.hueScale;
    }

    return [h, s, l];
  }

  /// Converts HSL values back to RGB.
  /// [h] is Hue in degrees (0–360), [s] is Saturation (0–1),
  /// [l] is Lightness (0–1).
  List<int> _hslToRgb(double h, double s, double l) {
    double r;
    double g;
    double b;

    /// If saturation is zero, the color is a shade of gray
    /// and all channels equals to lightness
    if (s == 0) {
      r = g = b = l;
    } else {
      /// Convert hue to RGB
      double hueToRgb(double p, double q, double tRaw) {
        double t = tRaw;

        /// Hue must be within the 0–1 range
        if (t < 0) t += 1;
        if (t > 1) t -= 1;

        /// Determine RGB component based on hue segment
        if (t < ColorConstants.sixth) return p + (q - p) * 6 * t;
        if (t < ColorConstants.half) return q;
        if (t < ColorConstants.twoThirds) {
          return p + (q - p) * (ColorConstants.twoThirds - t) * 6;
        }

        return p;
      }

      /// Calculate q and p based on lightness
      final double q = l < ColorConstants.half ? l * (1 + s) : l + s - l * s;
      final double p = 2 * l - q;

      /// Normalize hue to [0.0, 1.0]
      final double hK = h / 360;

      /// Calculate RGB channels using hue offset
      r = hueToRgb(p, q, hK + ColorConstants.hueToRgbOffset);
      g = hueToRgb(p, q, hK);
      b = hueToRgb(p, q, hK - ColorConstants.hueToRgbOffset);
    }

    return [
      (r * ColorConstants.rgbMaxValue).round(),
      (g * ColorConstants.rgbMaxValue).round(),
      (b * ColorConstants.rgbMaxValue).round(),
    ];
  }

  /// Converts an RGB list to a 32-bit ARGB color integer with full opacity
  /// Example: [255, 87, 51] -> (0xFFFF5733, [255, 87, 51])
  (int, List<int>) _rgbToFullColor(List<int> rgb) {
    final int r = rgb.first;
    final int g = rgb[1];
    final int b = rgb[2];

    /// Shift the red and green values to their respective bit positions
    final int redPart = r << ColorConstants.redBitShifts;
    final int greenPart = g << ColorConstants.greenBitShifts;

    /// Combine alpha, red, green, and blue into a single 32-bit color
    final int fullColor = ColorConstants.alphaChannel | redPart | greenPart | b;

    return (fullColor, [r, g, b]);
  }

  /// Calculates the complementary RGB color for a given [rgb] list.
  /// The complementary color is computed by subtracting each component from 255
  /// Example: [255, 87, 51] -> [0, 168, 204]
  List<int> _getComplementaryRgb(List<int> rgb) {
    final int r = 255 - rgb.first;
    final int g = 255 - rgb[1];
    final int b = 255 - rgb[2];

    return [r, g, b];
  }
}
