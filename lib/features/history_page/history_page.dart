import 'package:auto_route/annotations.dart';
import 'package:color_generator/core/presentation/custom_app_bar/custom_app_bar.dart';
import 'package:color_generator/core/presentation/utils/build_context_extensions/build_context_extensions.dart';
import 'package:color_generator/features/color_generator_page/application/color_generator_bloc.dart';
import 'package:color_generator/features/history_page/widgets/history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/presentation/colors/app_colors.dart';
import '../../../core/presentation/main_container/main_container.dart';
import '../../core/presentation/modal/modal.dart';
import '../../core/presentation/reset_button/reset_button.dart';

const defaultBgColor = AppColors.lightWarmOrange;

@RoutePage()
class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  late ColorGeneratorBloc _clrBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _clrBloc = context.read<ColorGeneratorBloc>();
  }

  void _resetColorsHistory() {
    _clrBloc.add(ColorGeneratorEvent.resetHistory());
  }

  void _onSetNewColor(Color color) {
    Navigator.pop(context);
    _clrBloc.add(ColorGeneratorEvent.setBackgroundColor(color: color));
  }

  Future<void> _showUpdateBgColorDialog(
    BuildContext context,
    Color color,
    String label,
  ) async {
    await showDialog(
      context: context,
      builder: (context) {
        return ShowCustomDialog(
          title: label,
          description: 'Set new background color on home page.',
          onCancel: () => Navigator.pop(context),
          onSubmit: () => _onSetNewColor(color),
        );
      },
    );
  }

  Future<void> _showDeleteHistoryDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return ShowCustomDialog(
          title: 'Delete history',
          description: 'Are you sure?',
          onCancel: () => Navigator.pop(context),
          onSubmit: () {
            Navigator.pop(context);
            _resetColorsHistory();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorGeneratorBloc, ColorGeneratorState>(
      builder: (context, state) {
        final history = state.data.historyList;
        return Scaffold(
          appBar: CustomAppBar.history(
            subtitle: 'Your last ${history.length} colors',
            centerTitle: true,
            titleTextStyle: context.textTheme.headlineMedium,
            actions: [
              ResetButton(onResetData: () => _showDeleteHistoryDialog(context)),
            ],
          ),
          body: SafeArea(
            bottom: false,
            child: MainContainer(
              child: state.maybeWhen(
                loading: (_) => Center(child: CircularProgressIndicator()),
                loaded: (updatedState) {
                  if (updatedState.historyList.isEmpty) {
                    return Center(
                      child: Text(
                        'There is no history yet.',
                        style: context.textTheme.bodyLarge,
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: updatedState.historyList.length,
                    itemBuilder: (context, index) {
                      final historyItem = updatedState.historyList[index];
                      final color = updatedState.parsedColor(historyItem.color);

                      return ColorHistoryCard(
                        color: color,
                        label: historyItem.color,
                        onDoubleTap: () => _showUpdateBgColorDialog(
                          context,
                          color,
                          historyItem.color,
                        ),
                      );
                    },
                  );
                },
                orElse: () => const SizedBox(),
              ),
            ),
          ),
        );
      },
    );
  }
}
