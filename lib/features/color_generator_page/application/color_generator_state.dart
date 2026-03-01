part of 'color_generator_bloc.dart';

@freezed
abstract class ColorGeneratorState with _$ColorGeneratorState {
  const factory ColorGeneratorState.initial(ColorGeneratorStateData data) =
      ColorGeneratorStateInitial;

  const factory ColorGeneratorState.loading(ColorGeneratorStateData data) =
      ColorGeneratorStateLoading;

  const factory ColorGeneratorState.error(ColorGeneratorStateData data) =
      ColorGeneratorStateError;

  const factory ColorGeneratorState.loaded(ColorGeneratorStateData data) =
      ColorGeneratorStateLoaded;
}

@freezed
abstract class ColorGeneratorStateData with _$ColorGeneratorStateData {
  const ColorGeneratorStateData._();

  const factory ColorGeneratorStateData({
    @Default(null) Color? backgroundColor,
    @Default(null) String? backgroundColorLabel,
    @Default(1) double opacity,
    @Default([]) List<ColorHistoryEntry> history,
  }) = _ColorGeneratorStateData;

  Color get bgColor => backgroundColor ?? AppColors.secondaryBlack;
  String get label => backgroundColorLabel ?? '';
  double get opacityValue => opacity ?? 1;

  List<ColorHistoryEntry> get historyList => history;
}
