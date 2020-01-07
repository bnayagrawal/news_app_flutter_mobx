import 'package:News/common/themes.dart';
import 'package:mobx/mobx.dart';
import 'preference_service.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

// The store-class
abstract class _AppStore with Store {
  PreferenceService _preferenceService;

  _AppStore(this._preferenceService) {
    apiKey = _preferenceService.apiKey;
    themeSetBySystem = _preferenceService.themeSetBySystem;
    usePitchBlack = _preferenceService.usePitchBlack;
    useDarkMode = _preferenceService.useDarkMode;
  }

  @observable
  String apiKey;

  @observable
  bool useDarkMode;

  @observable
  bool usePitchBlack;

  @observable
  bool themeSetBySystem;

  @action
  setApiKey(String newApiKey) {
    _preferenceService.apiKey = newApiKey;
    apiKey = newApiKey;
  }

  @action
  setDarkMode(bool value) {
    _preferenceService.useDarkMode = value;
    useDarkMode = value;
  }

  @action
  setPitchBlack(bool value) {
    _preferenceService.usePitchBlack = value;
    usePitchBlack = value;
  }

  @action
  setSystemTheme(bool value) {
    _preferenceService.themeSetBySystem = value;
    themeSetBySystem = value;
  }
}
