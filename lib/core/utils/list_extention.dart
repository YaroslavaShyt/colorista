import 'package:colorista/core/constants/color_constants.dart';
import 'package:flutter/material.dart';

/// Extension for converting list data
extension ListExtention on List<int> {
  /// Convert list of integers to RGB-Color with opacity
  Color toColor({double alpha = 1.0}) {
    if (length < ColorConstants.rgbQuantity) {
      return Colors.transparent;
    }

    /// Clamp alpha value to be in required range
    final double clampedAlpha = alpha.clamp(0.0, 1.0);

    return Color.fromRGBO(
      /// Red
      first,

      /// Green
      this[1],

      /// Blue
      this[2],

      /// Transparency
      clampedAlpha,
    );
  }
}
