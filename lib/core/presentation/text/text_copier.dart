import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextCopier extends StatefulWidget {
  final Widget child;
  final String text;
  final void Function(LongPressStartDetails)? onLongPressStart;
  final void Function(LongPressEndDetails)? onLongPressEnd;

  const TextCopier({
    super.key,
    required this.child,
    required this.text,
    this.onLongPressStart,
    this.onLongPressEnd,
  });
  @override
  State<TextCopier> createState() => _TextCopierState();
}

class _TextCopierState extends State<TextCopier> {
  void _copyText() async =>
      await Clipboard.setData(ClipboardData(text: widget.text));

  void onLogPress(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    _copyText();
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Coppied: ${widget.text}')));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: widget.onLongPressStart,
      onLongPressEnd: widget.onLongPressEnd,
      onLongPress: () => onLogPress(context),
      child: widget.child,
    );
  }
}
