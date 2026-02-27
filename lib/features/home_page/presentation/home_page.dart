import 'package:flutter/material.dart';
import '../../../core/presentation/colors/app_colors.dart';
import '../../../core/presentation/utils/color_utils/color_utils.dart';

const defaultBgColor = AppColors.defaultWhite;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _bgColor = defaultBgColor;
  String _colorLabel = colorToRgbaString(defaultBgColor);

  void _updateBgColorAndColorLabel() {
    final newColor = getNewRgbaColor();
    final colorLabel = colorToRgbaString(newColor);

    setState(() {
      _colorLabel = colorLabel;
      _bgColor = newColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.defaultWhite,
      body: Container(
        color: _bgColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Background current color:'),
              Text(
                _colorLabel,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updateBgColorAndColorLabel,
        tooltip: 'Update bgColor and bgColorLabel',
        child: const Icon(Icons.change_circle),
      ),
    );
  }
}
