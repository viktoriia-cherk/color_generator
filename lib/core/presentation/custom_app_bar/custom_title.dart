import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatefulWidget {
  final String? title;
  final String? subtitle;

  const CustomTitle({super.key, required this.title, this.subtitle});

  @override
  State<CustomTitle> createState() => _CustomTitleState();
}

class _CustomTitleState extends State<CustomTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.title ?? '',
          maxLines: widget.subtitle != null ? 1 : 2,
          overflow: TextOverflow.ellipsis,
        ),
        if (widget.subtitle != null)
          Text(
            widget.subtitle!,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
      ],
    );
  }
}
