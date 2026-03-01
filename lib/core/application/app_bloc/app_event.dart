part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.init() = InitAppState;

  const factory AppEvent.getAppTheme() = GetAppTheme;

  const factory AppEvent.setAppTheme({required ThemeMode themeMode}) =
      SetAppTheme;

  const factory AppEvent.toggleAppTheme() = ToggleAppTheme;

  const factory AppEvent.getIsFirstTimeInApp() = GetIsFirstTimeInApp;
  const factory AppEvent.setIsFirstTimeInApp() = SetIsFirstTimeInApp;
}
