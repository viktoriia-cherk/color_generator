import 'package:color_generator/core/presentation/utils/build_context_extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import '../../../../core/presentation/custom_sider/custom_sider.dart';

class ColorInfo extends StatefulWidget {
  final String colorLabel;
  final double opacity;
  final ValueChanged<double> onUpdateOpacity;

  const ColorInfo({
    super.key,
    required this.colorLabel,
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
        Text('Current color:', style: context.textTheme.headlineSmall),
        const SizedBox(height: 16.0),
        Text(widget.colorLabel, style: context.textTheme.bodyLarge),
        const SizedBox(height: 16.0),
        CustomSlider.opacity(
          value: widget.opacity,
          min: 0,
          max: 1,
          onChanged: widget.onUpdateOpacity,
        ),
      ],
    );
  }
}
