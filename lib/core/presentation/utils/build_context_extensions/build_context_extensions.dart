import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  SliderThemeData get sliderTheme => Theme.of(this).sliderTheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  Brightness get brightness => Theme.of(this).brightness;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ElevatedButtonThemeData get elevatedButton =>
      Theme.of(this).elevatedButtonTheme;

  bool get isDarkThemeMode => brightness == Brightness.dark;

  Brightness _estimateColor(Color color) =>
      ThemeData.estimateBrightnessForColor(color);

  bool isDarkTextColor(Color color) => _estimateColor(color) == Brightness.dark;
}
