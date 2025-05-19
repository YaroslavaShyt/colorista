/// Constant values, used for color generation

class ColorConstants {
  /// RGB values quantity
  static const int rgbQuantity = 3;

  /// default color to display on home screen
  static const int defaultHexColor = 0xffffff;

  /// Maximum value for the Red channel
  static const int redMaxValue = 256;

  /// Maximum value for the Green channel
  static const int greenMaxValue = 256;

  /// Maximum value for the Blue channel (
  static const int blueMaxValue = 256;

  /// Alpha channel value (fully opaque: 0xFF),
  /// shifted 24 bits to the left to occupy the highest
  /// 8 bits of a 32-bit ARGB color
  static const int alphaChannel = 0xFF << 24;

  /// Bit shift required for the Red channel in an ARGB [32-bit color format]
  static const int redBitShifts = 16;

  /// Bit shift required for the green channel in an ARGB [32-bit color format]
  static const int greenBitShifts = 8;

  /// Maximum value for RGB components (0-255)
  static const int rgbMaxValue = 255;

  /// Scaling factor for hue, used for converting RGB to HSL
  /// (1 full hue = 360d / 6 steps)
  static const double hueScale = 60.0;

  /// Offset value for hue conversion to RGB when calculating colors for triad
  /// (used to shift hue for triadic colors)
  static const double hueToRgbOffset = 1 / 3;

  /// One-sixth of the hue range
  /// (used in calculations for hue adjustments)
  static const double sixth = 1 / 6;

  /// Half of the hue range
  /// (used for brightness checks in HSL conversion)
  static const double half = 0.5;

  /// Two-thirds of the hue range
  /// (used in HSL calculations)
  static const double twoThirds = 2 / 3;

  /// Offset for red hue in triadic colors
  /// (starting point for triad)
  static const double hueRedOffset = 0.0;

  /// Offset for green hue in triadic colors
  /// (120d shift from red in HSL)
  static const double hueGreenOffset = 2.0;

  /// Offset for blue hue in triadic colors
  /// (240d shift from red in HSL)
  static const double hueBlueOffset = 4.0;

  /// Compensation for hue to ensure the correct calculation of triadic colors
  static const double hueCompensation = 6.0;
}
