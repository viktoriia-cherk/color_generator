import 'package:color_generator/core/presentation/text/text_copier.dart';
import 'package:flutter/material.dart';
import 'package:color_generator/core/presentation/colors/app_colors.dart';
import '../../../core/presentation/utils/build_context_extensions/build_context_extensions.dart';

class ColorHistoryCard extends StatefulWidget {
  final Color color;
  final String label;

  const ColorHistoryCard({super.key, required this.color, required this.label});

  @override
  State<ColorHistoryCard> createState() => _ColorHistoryCardState();
}

class _ColorHistoryCardState extends State<ColorHistoryCard> {
  bool _isHolding = false;

  void _onLongPressStart(LongPressStartDetails details) {
    setState(() => _isHolding = true);
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    setState(() => _isHolding = false);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _isHolding ? 0.97 : 1.0,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      child: TextCopier(
        onLongPressStart: _onLongPressStart,
        onLongPressEnd: _onLongPressEnd,
        text: widget.label,
        child: Card(
          color: AppColors.primaryWhite,
          surfaceTintColor: AppColors.primaryWhiteWithOpacity,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.label,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: AppColors.primaryBlack,
                      ),
                    ),
                    const SizedBox(height: 6),

                    Text(
                      'Copy me by long press 😊',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: AppColors.primaryBlack,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
