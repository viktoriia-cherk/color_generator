import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

ThemeData baseTheme(Brightness brightness) {
  final isDark = brightness == Brightness.dark;

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: isDark ? _getDarkColorScheme() : _getColorScheme(),
    sliderTheme: isDark ? _getDarkSliderTheme() : _getSliderTheme(),
  );
}

ColorScheme _getDarkColorScheme() {
  return const ColorScheme(
    brightness: Brightness.dark,

    primary: AppColors.warmOrange,
    onPrimary: AppColors.secondaryBlack,

    secondary: AppColors.graphite,
    onSecondary: AppColors.white,

    surface: AppColors.secondaryBlack,
    onSurface: AppColors.secondaryWhite,

    error: AppColors.red,
    onError: AppColors.white,
  );
}

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

SliderThemeData _getDarkSliderTheme() {
  return SliderThemeData(
    activeTrackColor: AppColors.warmOrange,
    inactiveTrackColor: AppColors.whiteWithOpacity,
    trackHeight: 10,
    thumbColor: AppColors.primaryWhite,
    overlayColor: AppColors.primaryWhiteWithOpacity,
    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
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
