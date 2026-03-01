import 'local_storage.dart';

class SharedStorageService {
  SharedStorageService();

  late LocalStorage _prefs;

  Future<SharedStorageService> init() async {
    _prefs = await LocalStorage().init();
    return this;
  }

  Future<bool> cleanStorage() => _prefs.cleanStorage();

  Future<bool> setString(String key, String value) =>
      _prefs.setValue<String>(key, value);

  Future<bool> setBool(String key, bool value) =>
      _prefs.setValue<bool>(key, value);

  Future<bool> setStringsList(String key, List<String> value) =>
      _prefs.setValue<List<String>>(key, value);

  String? getString(String key) => _prefs.getValue<String>(key);

  bool? getBool(String key) => _prefs.getValue<bool>(key);

  List<String>? getStringsList(String key) =>
      _prefs.getValue<List<String>>(key);

  Future<bool> remove(String key) => _prefs.remove(key);
}
