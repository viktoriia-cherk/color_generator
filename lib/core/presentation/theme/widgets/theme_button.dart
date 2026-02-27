import 'package:color_generator/core/presentation/utils/build_context_extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class ThemeButton extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const ThemeButton({super.key, required this.onToggleTheme});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    final icon = context.isDarkThemeMode
        ? Icons.brightness_2_outlined
        : Icons.brightness_low_outlined;

    return IconButton(onPressed: widget.onToggleTheme, icon: Icon(icon));
  }
}
