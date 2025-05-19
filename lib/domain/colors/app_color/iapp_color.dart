/// Defines the abstract interface for App color model

abstract interface class IAppColor {
  /// The hexadecimal representation of the color.
  /// Example: 0xFF3366
  final int hexColor;

  /// The RGB representation of the color as a list [red, green, blue].
  /// Example: [203, 40, 230]
  final List<int> rgbColor;

  /// Name of the color.
  /// Example: "Sky Blue"
  final String name;

  /// A list representing the color triad.
  /// Color order value [int] and a list of RGB values [List<int>]
  /// Example: [(1, [255, 0, 0])]
  final List<(int, List<int>)> colorTriad;

  /// The RGB values of the complementary color
  final List<int> complementaryColor;

  IAppColor({
    required this.hexColor,
    required this.rgbColor,
    required this.name,
    required this.colorTriad,
    required this.complementaryColor,
  });

  /// Returns a copy of the current color with optional property overrides
  IAppColor copyWith({
    int? hexColor,
    List<int>? rgbColor,
    String? name,
    List<(int, List<int>)>? colorTriad,
    List<int>? complementaryColor,
  });
}
