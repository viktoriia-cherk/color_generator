import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  SliderThemeData get sliderTheme => Theme.of(this).sliderTheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  Brightness get brightness => Theme.of(this).brightness;

  bool get isDarkThemeMode => brightness == Brightness.dark;
}
