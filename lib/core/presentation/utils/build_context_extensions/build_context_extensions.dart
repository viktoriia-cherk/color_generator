import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  SliderThemeData get sliderTheme => Theme.of(this).sliderTheme;
}
