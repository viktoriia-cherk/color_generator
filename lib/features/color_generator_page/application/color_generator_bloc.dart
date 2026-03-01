import 'dart:async';
import 'dart:convert';
import 'package:color_generator/core/presentation/colors/app_colors.dart';
import 'package:color_generator/core/presentation/utils/color_utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/application/app_bloc/app_bloc.dart';
import '../../../core/infrastructure/services/shared_storage/shared_storage_keys.dart';
import '../../../core/infrastructure/services/shared_storage/shared_storage_service.dart';
import '../domain/color_history_entry.dart';

part 'color_generator_bloc.freezed.dart';

part 'color_generator_event.dart';

part 'color_generator_state.dart';

@singleton
class ColorGeneratorBloc
    extends Bloc<ColorGeneratorEvent, ColorGeneratorState> {
  final SharedStorageService _storageService;
  final AppBloc _appBloc;

  ColorGeneratorBloc(this._storageService, this._appBloc)
    : super(const ColorGeneratorState.initial(ColorGeneratorStateData())) {
    on<InitColorGenerator>(_onInitColorGenerator);
    on<GetBackgroundColor>(_onGetBackgroundColor);
    on<SetDefaultColor>(_onSetDefaultColor);
    on<SetBackgroundColor>(_onSetBackgroundColor);
    on<SetLabel>(_onSetLabel);
    on<SetOpacity>(_onSetOpacity);
    on<GetColorsHistory>(_onGetColorsHistory);
    on<SetColorsHistory>(_onSetColorsHistory);
  }

  Future<void> _onInitColorGenerator(
    InitColorGenerator event,
    Emitter<ColorGeneratorState> emit,
  ) async {
    emit(const ColorGeneratorState.initial(ColorGeneratorStateData()));
  }

  void _onGetBackgroundColor(
    GetBackgroundColor event,
    Emitter<ColorGeneratorState> emit,
  ) {
    final savedBgColor = _storageService.getString(APP_BG_COLOR);

    if (savedBgColor == null) {

      add(SetDefaultColor(color: AppColors.secondaryBlack));
      return;
    }

    final convertedRgba = rgbaStringToColor(savedBgColor);

    emit(
      ColorGeneratorState.loaded(
        state.data.copyWith(
          backgroundColor: convertedRgba,
          backgroundColorLabel: savedBgColor,
          opacity: convertedRgba.a,
        ),
      ),
    );
  }

  Future<void> _onSetDefaultColor(
    SetDefaultColor event,
    Emitter<ColorGeneratorState> emit,
  ) async {
    final defaultClr = event.color;
    final label = colorToRgbaString(defaultClr);
    final opacity = defaultClr.a;

    await _storageService.setString(APP_BG_COLOR, label);
    print('defaultClr ---------------$defaultClr');

    emit(
      ColorGeneratorState.loaded(
        state.data.copyWith(
          backgroundColor: defaultClr,
          backgroundColorLabel: label,
          opacity: opacity,
        ),
      ),
    );
  }

  Future<void> _onSetBackgroundColor(
    SetBackgroundColor event,
    Emitter<ColorGeneratorState> emit,
  ) async {
    final newColor = event.color;
    final clrToString = colorToRgbaString(newColor);

    await _storageService.setString(APP_BG_COLOR, clrToString);

    emit(
      ColorGeneratorState.loaded(
        state.data.copyWith(
          backgroundColor: newColor,
          backgroundColorLabel: clrToString,
          opacity: newColor.a,
        ),
      ),
    );
  }

  void _onSetLabel(SetLabel event, Emitter<ColorGeneratorState> emit) async {
    final label = event.label;
    emit(
      ColorGeneratorState.loaded(
        state.data.copyWith(backgroundColorLabel: label),
      ),
    );
  }

  void _onSetOpacity(SetOpacity event, Emitter<ColorGeneratorState> emit) {
    final opacity = event.opacity;
    emit(ColorGeneratorState.loaded(state.data.copyWith(opacity: opacity)));
  }

  void _onGetColorsHistory(
    GetColorsHistory event,
    Emitter<ColorGeneratorState> emit,
  ) {
    final jsonString = _storageService.getString(APP_COLORS_HISTORY);

    List<ColorHistoryEntry> savedHistory = [];

    if (jsonString != null && jsonString.isNotEmpty) {
      try {
        final List<dynamic> jsonList = jsonDecode(jsonString);
        savedHistory = jsonList
            .map((e) => ColorHistoryEntry.fromJson(e as Map<String, dynamic>))
            .toList();
      } catch (e) {
        savedHistory = [];
      }
    }

    emit(
      ColorGeneratorState.loaded(state.data.copyWith(history: savedHistory)),
    );
  }

  Future<void> _onSetColorsHistory(
    SetColorsHistory event,
    Emitter<ColorGeneratorState> emit,
  ) async {
    final newColor = event.color;
    final history = state.data.history;
    final clrToString = colorToRgbaString(newColor);

    final newEntry = ColorHistoryEntry(
      color: clrToString,
      timestamp: DateTime.now(),
    );

    final updatedHistory = [newEntry, ...history];

    if (updatedHistory.length > 20) {
      updatedHistory.removeLast();
    }

    final historyJson = updatedHistory.map((e) => e.toJson()).toList();
    await _storageService.setString(
      APP_COLORS_HISTORY,
      jsonEncode(historyJson),
    );

    emit(
      ColorGeneratorState.loaded(state.data.copyWith(history: updatedHistory)),
    );
  }
}
