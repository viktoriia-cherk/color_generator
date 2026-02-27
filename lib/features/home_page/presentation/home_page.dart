import 'package:color_generator/core/presentation/utils/build_context_extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import '../../../core/presentation/colors/app_colors.dart';
import '../../../core/presentation/custom_sider/custom_sider.dart';
import '../../../core/presentation/main_container/main_container.dart';
import '../../../core/presentation/utils/color_utils/color_utils.dart';
import '../../../core/presentation/utils/maths_utils/maths_utils.dart';

const defaultBgColor = AppColors.lightWarmOrange;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
    return Scaffold(
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
                    const Text('Background current color:'),
                    Text(
                      _colorLabel,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),

                    CustomSlider.opacity(
                      value: _bgOpacity,
                      min: 0,
                      max: 1,
                      onChanged: _updateOpacity,
                      style: context.sliderTheme.copyWith(
                        activeTrackColor: AppColors.red,
                      ),
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
