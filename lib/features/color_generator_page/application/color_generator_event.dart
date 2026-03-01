part of 'color_generator_bloc.dart';

@freezed
class ColorGeneratorEvent with _$ColorGeneratorEvent {
  const factory ColorGeneratorEvent.initColorGenerator() = InitColorGenerator;

  const factory ColorGeneratorEvent.getBackgroundColor() = GetBackgroundColor;
  const factory ColorGeneratorEvent.setBackgroundColor({required Color color}) =
      SetBackgroundColor;

  const factory ColorGeneratorEvent.setDefaultColor({required Color color}) =
      SetDefaultColor;

  const factory ColorGeneratorEvent.setLabel({required String label}) =
      SetLabel;

  const factory ColorGeneratorEvent.setOpacity({required double opacity}) =
      SetOpacity;

  const factory ColorGeneratorEvent.getColorsHistory() = GetColorsHistory;
  const factory ColorGeneratorEvent.setColorsHistory({required Color color}) =
      SetColorsHistory;
}
