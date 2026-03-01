import 'package:color_generator/core/presentation/utils/build_context_extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import '../../../../core/presentation/custom_sider/custom_sider.dart';
import '../../../../core/presentation/text/text_copier.dart';

class ColorInfo extends StatefulWidget {
  final GlobalKey keyForText;
  final GlobalKey keyForSlider;
  final String colorLabel;
  final Color textColor;
  final double opacity;
  final ValueChanged<double> onUpdateOpacity;

  const ColorInfo({
    super.key,
    required this.keyForText,
    required this.colorLabel,
    required this.keyForSlider,
    required this.textColor,
    required this.opacity,
    required this.onUpdateOpacity,
  });

  @override
  State<ColorInfo> createState() => _ColorInfoState();
}

class _ColorInfoState extends State<ColorInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Current color:',
          style: context.textTheme.headlineSmall?.copyWith(
            color: widget.textColor,
          ),
        ),
        const SizedBox(height: 16.0),
        Showcase(
          key: widget.keyForText,
          description: "You can copy color by long press!",
          child: TextCopier(
            text: widget.colorLabel,
            child: Text(
              widget.colorLabel,
              style: context.textTheme.bodyLarge?.copyWith(
                color: widget.textColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Showcase(
          key: widget.keyForSlider,
          description: "You can change color opacity!",
          child: CustomSlider.opacity(
            value: widget.opacity,
            min: 0,
            max: 1,
            onChanged: widget.onUpdateOpacity,
          ),
        ),
      ],
    );
  }
}
