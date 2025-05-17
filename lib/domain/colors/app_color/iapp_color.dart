abstract interface class IAppColor {
  IAppColor({
    required this.hexColor,
    required this.rgbColor,
    required this.name,
    required this.colorTriad,
    required this.complementaryColor,
  });

  final int hexColor;
  final List<int> rgbColor;
  final String name;
  final List<(int, List<int>)> colorTriad;
  final List<int> complementaryColor;

  IAppColor copyWith({
    int? hexColor,
    List<int>? rgbColor,
    String? name,
    List<(int, List<int>)>? colorTriad,
    List<int>? complementaryColor,
  });
}
