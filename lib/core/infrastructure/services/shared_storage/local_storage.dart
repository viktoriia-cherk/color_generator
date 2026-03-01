import 'package:color_generator/core/infrastructure/services/shared_storage/storage_actions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage extends StorageActions {
  late SharedPreferences _prefs;

  LocalStorage();

  Future<LocalStorage> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  @override
  Future<bool> cleanStorage() => _prefs.clear();

  @override
  T? getValue<T extends Object?>(String key) => _prefs.get(key) as T?;

  String? getString(String key) => _prefs.getString(key);

  @override
  Future<bool> setValue<T extends Object?>(String key, T value) {
    if (value is bool) {
      return _prefs.setBool(key, value);
    } else if (value is int) {
      return _prefs.setInt(key, value);
    } else if (value is double) {
      return _prefs.setDouble(key, value);
    } else if (value is List<String>) {
      return _prefs.setStringList(key, value);
    } else {
      return _prefs.setString(key, value as String);
    }
  }

  @override
  Future<bool> remove(String key) => _prefs.remove(key);
}
