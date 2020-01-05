import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  final String _themeKey = 'theme';
  final String _themeSetBySystemKey = 'themeSetBySystem';
  final String _apiKey = 'apiKey';

  final SharedPreferences _sharedPreferences;

  const PreferenceService(this._sharedPreferences);

  set useDarkMode(bool value) {
    _sharedPreferences.setBool(_themeKey, value);
  }

  set themeSetBySystem(bool value) {
    _sharedPreferences.setBool(_themeSetBySystemKey, value);
  }

  set apiKey(String value) {
    _sharedPreferences.setString(_apiKey, value);
  }

  String get apiKey => _sharedPreferences.getString(_apiKey);

  bool get themeSetBySystem => _sharedPreferences.getBool(_themeSetBySystemKey) ?? false;

  bool get useDarkMode => _sharedPreferences.getBool(_themeKey) ?? false;
}