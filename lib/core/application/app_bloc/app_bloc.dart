import 'dart:async';
import 'package:color_generator/core/domain/theme/theme_mode_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../infrastructure/services/shared_storage/shared_storage_keys.dart';
import '../../infrastructure/services/shared_storage/shared_storage_service.dart';

part 'app_bloc.freezed.dart';

part 'app_event.dart';

part 'app_state.dart';

@singleton
class AppBloc extends Bloc<AppEvent, AppState> {
  final SharedStorageService _storageService;

  AppBloc(this._storageService)
    : super(const AppState.initial(AppStateData())) {
    on<InitAppState>(_onInitAppState);
    on<GetAppTheme>(_onGetAppTheme);
    on<SetAppTheme>(_onSetAppTheme);
    on<ToggleAppTheme>(_onToggleAppTheme);
    on<GetIsFirstTimeInApp>(_onGetIsFirstTimeInApp);
    on<SetIsFirstTimeInApp>(_onSetIsFirstTimeInApp);
  }

  Future<void> _onInitAppState(
    InitAppState event,
    Emitter<AppState> emit,
  ) async {
    emit(const AppState.initial(AppStateData()));
  }

  void _onGetIsFirstTimeInApp(
    GetIsFirstTimeInApp event,
    Emitter<AppState> emit,
  ) {
    final isFirstTimeInApp = _storageService.getBool(FIRST_TIME_IN_APP);
    emit(
      AppState.loaded(
        state.data.copyWith(firstTimeInApp: isFirstTimeInApp ?? false),
      ),
    );
  }

  Future<void> _onSetIsFirstTimeInApp(
    SetIsFirstTimeInApp event,
    Emitter<AppState> emit,
  ) async {
    await _storageService.setBool(FIRST_TIME_IN_APP, true);
    emit(AppState.loaded(state.data.copyWith(firstTimeInApp: true)));
  }

  Future<void> _onGetAppTheme(GetAppTheme event, Emitter<AppState> emit) async {
    final savedTheme = _storageService.getString(APP_THEME_MODE);
    if (savedTheme == null) {
      add(SetAppTheme(themeMode: ThemeMode.light));
    } else {
      final currentMode = (ThemeModeType.fromString(savedTheme).isDark
          ? ThemeMode.dark
          : ThemeMode.light);
      emit(AppState.loaded(state.data.copyWith(themeMode: currentMode)));
    }
  }

  Future<void> _onSetAppTheme(SetAppTheme event, Emitter<AppState> emit) async {
    final newThemeMode = event.themeMode;

    await _storageService.setString(
      APP_THEME_MODE,
      newThemeMode.name.toUpperCase(),
    );

    emit(AppState.loaded(state.data.copyWith(themeMode: newThemeMode)));
  }

  Future<void> _onToggleAppTheme(
    ToggleAppTheme event,
    Emitter<AppState> emit,
  ) async {
    final newThemeMode = state.data.themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;

    await _storageService.setString(
      APP_THEME_MODE,
      newThemeMode.name.toUpperCase(),
    );

    emit(AppState.loaded(state.data.copyWith(themeMode: newThemeMode)));
  }
}
