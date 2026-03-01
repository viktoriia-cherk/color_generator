import 'package:flutter/material.dart';

class TooltipButton extends StatefulWidget {
  final VoidCallback onStartTooltip;

  const TooltipButton({super.key, required this.onStartTooltip});

  @override
  State<TooltipButton> createState() => _TooltipButtonState();
}

class _TooltipButtonState extends State<TooltipButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onStartTooltip,
      icon: Icon(Icons.tips_and_updates_outlined),
    );
  }
}
