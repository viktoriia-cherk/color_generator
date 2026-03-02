import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

ThemeData baseTheme(Brightness brightness) {
  final isDark = brightness == Brightness.dark;

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: isDark ? _darkColorScheme : _lightColorScheme,
    sliderTheme: _getSliderTheme(isDark),
    elevatedButtonTheme: _getElevatedButtonTheme(isDark),
    outlinedButtonTheme: _getOutlinedButtonTheme(isDark),
    bottomNavigationBarTheme: _getBottomNavTheme(isDark),
  );
}

const _darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.warmOrange,
  onPrimary: AppColors.secondaryBlack,
  secondary: AppColors.graphite,
  onSecondary: AppColors.white,
  surface: AppColors.graphite,
  onSurface: AppColors.secondaryWhite,
  error: AppColors.red,
  onError: AppColors.white,
);

const _lightColorScheme = ColorScheme(
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

SliderThemeData _getSliderTheme(bool isDark) {
  return SliderThemeData(
    activeTrackColor: isDark ? AppColors.warmOrange : AppColors.white,
    inactiveTrackColor: isDark
        ? AppColors.whiteWithOpacity
        : AppColors.graphiteShadow,
    trackHeight: 10,
    thumbColor: isDark ? AppColors.primaryWhite : AppColors.graphite,
    overlayColor: isDark
        ? AppColors.primaryWhiteWithOpacity
        : AppColors.graphiteShadow,
    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
  );
}

const _selectedNavLabelStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14,
);

const _unselectedNavLabelStyle = TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 12,
);

BottomNavigationBarThemeData _getBottomNavTheme(bool isDark) {
  return BottomNavigationBarThemeData(
    backgroundColor: isDark
        ? AppColors.secondaryBlack
        : AppColors.secondaryWhite,
    selectedItemColor: isDark ? AppColors.warmOrange : AppColors.graphite,
    unselectedItemColor: isDark
        ? AppColors.whiteWithOpacity
        : AppColors.graphiteShadow,
    selectedLabelStyle: _selectedNavLabelStyle,
    unselectedLabelStyle: _unselectedNavLabelStyle,
    showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  );
}

ElevatedButtonThemeData _getElevatedButtonTheme(bool isDark) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: isDark ? AppColors.warmOrange : AppColors.graphite,
      foregroundColor: isDark ? AppColors.secondaryBlack : AppColors.white,
      disabledBackgroundColor: isDark
          ? AppColors.whiteWithOpacity
          : AppColors.graphiteShadow,
      disabledForegroundColor: isDark
          ? AppColors.graphite
          : AppColors.secondaryWhite,
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
    ),
  );
}

OutlinedButtonThemeData _getOutlinedButtonTheme(bool isDark) {
  final color = isDark ? AppColors.warmOrange : AppColors.graphite;

  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: color,
      side: BorderSide(color: color, width: 2),
      padding: const EdgeInsets.symmetric(vertical: 16),
      textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
