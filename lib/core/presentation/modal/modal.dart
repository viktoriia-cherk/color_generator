import 'package:flutter/material.dart';

class ShowTooltipDialog extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onCancel;
  final VoidCallback onSubmit;

  const ShowTooltipDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onCancel,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Text(description, textAlign: TextAlign.center),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: onCancel, child: const Text('No')),
                ElevatedButton(onPressed: onSubmit, child: const Text('Yes')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
