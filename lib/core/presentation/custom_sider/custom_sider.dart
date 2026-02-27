import 'package:color_generator/core/presentation/utils/build_context_extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final double value;
  final double min;
  final double max;
  final String? label;
  final ValueChanged<double> onChanged;
  final int? divisions;
  final SliderThemeData? style;

  const CustomSlider({
    super.key,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.label,
    this.divisions,
    this.style,
  });

  factory CustomSlider.opacity({
    required double value,
    required double min,
    required double max,
    String? label,
    required ValueChanged<double> onChanged,
    int? divisions,
  }) => CustomSlider(
    value: value,
    min: min,
    max: max,
    label: label,
    onChanged: onChanged,
  );

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: widget.style ?? context.sliderTheme,
      child: Slider(
        value: widget.value,
        min: widget.min,
        max: widget.max,
        divisions: widget.divisions,
        label: widget.label,
        onChanged: widget.onChanged,
      ),
    );
  }
}
