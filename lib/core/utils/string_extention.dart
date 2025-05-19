/// Extension for [String] parsing
extension StringExtention on String {
  /// Parses RGB to [List]
  /// "r(255, 87, 51)" → [255, 87, 51]
  List<int> parseRGB() {
    return replaceAll(RegExp(r'[^\d,]'), '').split(',').map(int.parse).toList();
  }

  static const String _hashSymbol = '#';
  static const int _hexRadix = 16;
  static const int _fullAlphaMask = 0xFF000000;

  /// Parses a hex color string
  /// "#FF5733" → 0xFFFF5733
  int parseHex() {
    return int.parse(replaceFirst(_hashSymbol, ''), radix: _hexRadix) +
        _fullAlphaMask;
  }
}
