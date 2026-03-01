enum ThemeModeType {
  light('LIGHT'),
  dark('DARK');

  final String type;
  const ThemeModeType(this.type);

  bool get isDark => this == dark;

  static ThemeModeType fromString(String value) {
    for (final mode in ThemeModeType.values) {
      if (mode.type == value.toUpperCase()) {
        return mode;
      }
    }
    return ThemeModeType.light;
  }
}
