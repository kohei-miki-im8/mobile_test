class EconaTypographyConfig {
  const EconaTypographyConfig._();

  // Figmaデザインの横幅を基準とする
  static const double _designWidth = 393;
  // 最小スケール
  static const double _minScale = 0.1;
  // 最大スケール
  static const double _maxScale = 2;
  // スケール基準値
  static double _scale = 1;

  static double get scale => _scale;

  static void initialize({
    required double deviceWidth,
  }) {
    final rawScale = deviceWidth / _designWidth;
    _scale = rawScale.clamp(_minScale, _maxScale);
  }
}