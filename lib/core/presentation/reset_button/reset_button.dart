import 'package:flutter/material.dart';

class ResetButton extends StatefulWidget {
  final VoidCallback onResetData;

  const ResetButton({super.key, required this.onResetData});

  @override
  State<ResetButton> createState() => _ResetButtonState();
}

class _ResetButtonState extends State<ResetButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onResetData,
      icon: Icon(Icons.restart_alt),
    );
  }
}
