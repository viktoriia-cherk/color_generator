import 'package:auto_route/annotations.dart';
import 'package:color_generator/core/presentation/custom_app_bar/custom_app_bar.dart';
import 'package:color_generator/core/presentation/tooltips/tooltips.dart';
import 'package:color_generator/core/presentation/utils/build_context_extensions/build_context_extensions.dart';
import 'package:color_generator/features/color_generator_page/application/color_generator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showcaseview/showcaseview.dart';
import '../../../../core/presentation/colors/app_colors.dart';
import '../../../../core/presentation/main_container/main_container.dart';
import '../../../../core/presentation/theme/widgets/theme_button.dart';
import '../../../../core/presentation/utils/color_utils/color_utils.dart';
import '../../../../core/presentation/utils/maths_utils/maths_utils.dart';
import '../../../core/application/app_bloc/app_bloc.dart';
import '../../../core/presentation/modal/modal.dart';
import '../../../core/presentation/reset_button/reset_button.dart';
import '../../../core/presentation/tooltip_button/tooltip_button.dart';
import '../../home_page/presentation/widgets/color_info.dart';

const defaultBgColor = AppColors.lightWarmOrange;

@RoutePage()
class ColorGeneratorPage extends StatefulWidget {
  const ColorGeneratorPage({super.key});

  @override
  State<ColorGeneratorPage> createState() => _ColorGeneratorPageState();
}

class _ColorGeneratorPageState extends State<ColorGeneratorPage> {
  final GlobalKey _firstKey = GlobalKey();
  final GlobalKey _secondKey = GlobalKey();
  final GlobalKey _thirdKey = GlobalKey();
  final GlobalKey _fourthKey = GlobalKey();
  final GlobalKey _fifthKey = GlobalKey();

  late ColorGeneratorBloc _clrBloc;
  late AppBloc _appBloc;
  bool _tooltipsAutoStart = false;
  bool _dialogShown = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_dialogShown) return;

    _clrBloc = context.read<ColorGeneratorBloc>();
    _appBloc = context.read<AppBloc>();

    final isFirstTimeInApp = _appBloc.state.data.firstTimeInApp;

    if (isFirstTimeInApp) {
      _dialogShown = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showTooltipDialog(context);
      });
    }
  }

  void _setFirstTimeInApp() => _appBloc.add(AppEvent.setIsFirstTimeInApp());

  Future<void> _showTooltipDialog(
    BuildContext context, [
    bool fromAppBar = false,
  ]) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return ShowCustomDialog(
          title: 'Tooltip tour',
          description: 'Would you like to see the tooltip?',
          onCancel: () {
            _setFirstTimeInApp();

            Navigator.pop(context);
          },
          onSubmit: () {
            if (!fromAppBar) {
              _setFirstTimeInApp();
            }

            Navigator.pop(context);
            setState(() {
              _tooltipsAutoStart = true;
            });
          },
        );
      },
    );
  }

  void _toggleTheme() => context.read<AppBloc>().add(AppEvent.toggleAppTheme());

  void _updateBgColorAndColorLabel() {
    final opacity = _clrBloc.state.data.opacityValue;
    final parsedValue = roundToDecimals(opacity);
    final newColor = getNewRgbaColor(opacity: parsedValue);

    _clrBloc.add(ColorGeneratorEvent.setBackgroundColor(color: newColor));
  }

  void _updateOpacity(double value) {
    final parsedValue = roundToDecimals(value);

    final updatedColor = updateColorOpacity(
      opacity: parsedValue,
      clr: _clrBloc.state.data.bgColor,
    );

    _clrBloc.add(ColorGeneratorEvent.setBackgroundColor(color: updatedColor));
  }

  void _resetColor() => _clrBloc.add(
    ColorGeneratorEvent.setDefaultColor(color: context.colorScheme.surface),
  );

  void _onCompleteGuideTour() {
    setState(() {
      _tooltipsAutoStart = false;
    });
  }

  void _updateHistory(Color newColor) =>
      _clrBloc.add(ColorGeneratorEvent.setColorsHistory(color: newColor));

  @override
  Widget build(BuildContext context) {
    final showcaseKeys = [_firstKey, _secondKey, _thirdKey, _fourthKey];

    return MultiBlocListener(
      listeners: [
        BlocListener<ColorGeneratorBloc, ColorGeneratorState>(
          listener: (_, colorGenState) =>
              _updateHistory(colorGenState.data.bgColor),
          listenWhen: (prev, curr) =>
              prev.data.backgroundColor != curr.data.backgroundColor,
        ),
      ],
      child: ToolTips(
        onComplete: (_, __) => _onCompleteGuideTour(),
        onDismiss: (_) => _onCompleteGuideTour(),
        autoStart: _tooltipsAutoStart,
        showcaseKeys: showcaseKeys,
        child: Scaffold(
          appBar: CustomAppBar.colorGeneratorPage(
            centerTitle: false,
            titleTextStyle: context.textTheme.headlineMedium,
            actions: [
              Showcase(
                key: _firstKey,
                description: "Change theme",
                child: ThemeButton(onToggleTheme: _toggleTheme),
              ),
              Showcase(
                key: _secondKey,
                description: "Show modal that could start tooltip tour",
                child: TooltipButton(
                  onStartTooltip: () => _showTooltipDialog(context, true),
                ),
              ),
              Showcase(
                key: _thirdKey,
                description: "Reset background color",
                child: ResetButton(onResetData: _resetColor),
              ),
            ],
          ),
          body: SafeArea(
            bottom: false,
            child: GestureDetector(
              onTap: _updateBgColorAndColorLabel,
              child: MainContainer(
                child: BlocBuilder<ColorGeneratorBloc, ColorGeneratorState>(
                  builder: (context, state) {
                    final bgColor = state.data.bgColor;

                    Color textColor = context.isDarkTextColor(bgColor)
                        ? AppColors.white
                        : AppColors.graphite;

                    return Container(
                      color: bgColor,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hello there!',
                              style: context.textTheme.headlineMedium?.copyWith(
                                color: textColor,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            ColorInfo(
                              keyForText: _fourthKey,
                              keyForSlider: _fifthKey,
                              colorLabel: state.data.label,
                              textColor: textColor,
                              opacity: state.data.opacityValue,
                              onUpdateOpacity: _updateOpacity,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
