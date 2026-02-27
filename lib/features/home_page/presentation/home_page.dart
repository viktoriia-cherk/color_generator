import 'package:color_generator/core/presentation/custom_app_bar/custom_app_bar.dart';
import 'package:color_generator/core/presentation/utils/build_context_extensions/build_context_extensions.dart';
import 'package:color_generator/features/home_page/presentation/widgets/color_info.dart';
import 'package:flutter/material.dart';
import '../../../core/presentation/colors/app_colors.dart';
import '../../../core/presentation/main_container/main_container.dart';
import '../../../core/presentation/theme/widgets/theme_button.dart';
import '../../../core/presentation/utils/color_utils/color_utils.dart';
import '../../../core/presentation/utils/maths_utils/maths_utils.dart';

const defaultBgColor = AppColors.lightWarmOrange;

class HomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const HomePage({super.key, required this.onToggleTheme});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _bgColor = defaultBgColor;
  String _colorLabel = colorToRgbaString(defaultBgColor);
  double _bgOpacity = 1;

  void _updateBgColorAndColorLabel() {
    final parsedValue = roundToDecimals(_bgOpacity);
    final newColor = getNewRgbaColor(opacity: parsedValue);
    final colorLabel = colorToRgbaString(newColor);

    setState(() {
      _colorLabel = colorLabel;
      _bgColor = newColor;
    });
  }

  void _updateOpacity(double value) {
    final parsedValue = roundToDecimals(value);

    final updatedColor = updateColorOpacity(
      opacity: parsedValue,
      clr: _bgColor,
    );

    final colorValue = colorToRgbaString(updatedColor);

    setState(() {
      _bgOpacity = value;
      _bgColor = updatedColor;
      _colorLabel = colorValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = context.isDarkTextColor(_bgColor)
        ? AppColors.white
        : AppColors.graphite;

    return Scaffold(
      appBar: CustomAppBar.home(
        title: 'Color Generator',
        centerTitle: true,
        titleTextStyle: context.textTheme.headlineMedium,
        actions: [ThemeButton(onToggleTheme: widget.onToggleTheme)],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: _updateBgColorAndColorLabel,
          child: MainContainer(
            child: Container(
              color: _bgColor,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello there!',
                      style: context.textTheme.headlineMedium?.copyWith(
                        color: textColor,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ColorInfo(
                      colorLabel: _colorLabel,
                      textColor: textColor,
                      opacity: _bgOpacity,
                      onUpdateOpacity: _updateOpacity,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
