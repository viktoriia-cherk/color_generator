import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextCopier extends StatelessWidget {
  final Widget child;
  final String text;
  const TextCopier({super.key, required this.child, required this.text});

  void _copyText() async => await Clipboard.setData(ClipboardData(text: text));

  void onLogPress(BuildContext context) {
    _copyText();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Coppied: $text')));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => onLogPress(context),
      child: child,
    );
  }
}
