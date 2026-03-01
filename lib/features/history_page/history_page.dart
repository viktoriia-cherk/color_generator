import 'package:auto_route/annotations.dart';
import 'package:color_generator/core/presentation/custom_app_bar/custom_app_bar.dart';
import 'package:color_generator/core/presentation/tooltips/tooltips.dart';
import 'package:color_generator/core/presentation/utils/build_context_extensions/build_context_extensions.dart';
import 'package:color_generator/features/home_page/presentation/widgets/color_info.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import '../../../core/presentation/colors/app_colors.dart';
import '../../../core/presentation/main_container/main_container.dart';
import '../../../core/presentation/theme/widgets/theme_button.dart';
import '../../../core/presentation/utils/color_utils/color_utils.dart';
import '../../../core/presentation/utils/maths_utils/maths_utils.dart';

const defaultBgColor = AppColors.lightWarmOrange;

@RoutePage()
class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Color _bgColor = defaultBgColor;
  String _colorLabel = colorToRgbaString(defaultBgColor);
  double _bgOpacity = 1;

  final GlobalKey _firstKey = GlobalKey();
  final GlobalKey _secondKey = GlobalKey();
  final GlobalKey _thirdKey = GlobalKey();

  void _updateBgColorAndColorLabel() {
    final parsedValue = roundToDecimals(_bgOpacity);
    final newColor = getNewRgbaColor(opacity: parsedValue);
    final colorLabel = colorToRgbaString(newColor);

    setState(() {
      _colorLabel = colorLabel;
      _bgColor = newColor;
    });
  }

  void _updateOpacity(double value) {
    final parsedValue = roundToDecimals(value);

    final updatedColor = updateColorOpacity(
      opacity: parsedValue,
      clr: _bgColor,
    );

    final colorValue = colorToRgbaString(updatedColor);

    setState(() {
      _bgOpacity = value;
      _bgColor = updatedColor;
      _colorLabel = colorValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final showcaseKeys = [_firstKey, _secondKey, _thirdKey];

    Color textColor = context.isDarkTextColor(_bgColor)
        ? AppColors.white
        : AppColors.graphite;

    return ToolTips(
      showcaseKeys: showcaseKeys,
      child: Scaffold(
        // appBar: CustomAppBar.home(
        //   title: 'Color Generator',
        //   centerTitle: true,
        //   titleTextStyle: context.textTheme.headlineMedium,
        //   actions: [ThemeButton(onToggleTheme: (){})],
        // ),
        body: SafeArea(
          bottom: false,
          child: GestureDetector(
            onTap: _updateBgColorAndColorLabel,
            child: MainContainer(
              child: Container(
                color: _bgColor,
                child: Center(
                  child: Column(
                    children: [
                      Showcase(
                        key: _firstKey,
                        description: "Це перший елемент",
                        child: const ListTile(title: Text("Item 4")),
                      ),
                      Showcase(
                        key: _secondKey,
                        description: "Це другий елемент",
                        child: const ListTile(title: Text("Item 5")),
                      ),
                      Showcase(
                        key: _thirdKey,
                        description: "Це третій елемент",
                        child: const ListTile(title: Text("Item 6")),
                      ),
                    ],
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Text(
                    //       'Hello there!',
                    //       style: context.textTheme.headlineMedium?.copyWith(
                    //         color: textColor,
                    //       ),
                    //     ),
                    //     const SizedBox(height: 16.0),
                    //     ColorInfo(
                    //       colorLabel: _colorLabel,
                    //       textColor: textColor,
                    //       opacity: _bgOpacity,
                    //       onUpdateOpacity: _updateOpacity,
                    //     ),
                    //   ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
