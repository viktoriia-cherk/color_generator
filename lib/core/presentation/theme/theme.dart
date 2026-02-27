import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

final ThemeData appThemeData = ThemeData(
  useMaterial3: true,
  colorScheme: _getColorScheme(),
  sliderTheme: _getSliderTheme(),
);

ColorScheme _getColorScheme() {
  return const ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.graphite,
    onPrimary: AppColors.tertiaryWhite,

    secondary: AppColors.warmOrange,
    onSecondary: AppColors.white,

    surface: AppColors.secondaryWhite,
    onSurface: AppColors.secondaryBlack,

    error: AppColors.red,
    onError: AppColors.white,
  );
}

SliderThemeData _getSliderTheme() {
  return SliderThemeData(
    activeTrackColor: AppColors.white,
    inactiveTrackColor: AppColors.graphiteShadow,
    trackHeight: 10,
    thumbColor: AppColors.graphite,
    overlayColor: AppColors.graphiteShadow,
    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
  );
}
