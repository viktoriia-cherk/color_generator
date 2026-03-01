part of 'app_bloc.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState.initial(AppStateData data) = AppStateInitial;

  const factory AppState.loading(AppStateData data) = AppStateLoading;

  const factory AppState.error(AppStateData data) = AppStateError;

  const factory AppState.loaded(AppStateData data) = AppStateLoaded;
}

@freezed
abstract class AppStateData with _$AppStateData {
  const AppStateData._();

  const factory AppStateData({
    @Default(null) ThemeMode? themeMode,
    @Default(true) bool firstTimeInApp,
  }) = _AppStateData;

  bool get isDarkThemeMode => themeMode == ThemeMode.dark;
}
