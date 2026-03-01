import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_history_entry.freezed.dart';
part 'color_history_entry.g.dart';

@freezed
abstract class ColorHistoryEntry with _$ColorHistoryEntry {
  const factory ColorHistoryEntry({
    required String color,
    required DateTime timestamp,
  }) = _ColorHistoryEntry;

  factory ColorHistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$ColorHistoryEntryFromJson(json);
}
