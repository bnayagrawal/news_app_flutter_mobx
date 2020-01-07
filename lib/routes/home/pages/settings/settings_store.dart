import 'package:News/common/app_store.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

// TODO: This is Redundant!
abstract class _SettingsStore with Store {
  AppStore _appStore;

  _SettingsStore(this._appStore) {
    apiKeyValue = _appStore.apiKey;
    useDarkModeValue = _appStore.useDarkMode;
    usePitchBlackValue = _appStore.usePitchBlack;
    themeSetBySystemValue = _appStore.themeSetBySystem;
  }

  @observable
  String apiKeyValue;

  @observable
  bool useDarkModeValue;

  @observable
  bool usePitchBlackValue;

  @observable
  bool themeSetBySystemValue;

  // Todo: Probably use a common store
  @observable
  String message;

  @action
  setNonValidatedApiKey(String value) {
    apiKeyValue = value;
  }

  @action
  setApiKey() {
    if (this.apiKeyValue != _appStore.apiKey) {
      message = 'News API key updated!';
    }
    _appStore.setApiKey(apiKeyValue);
    this.apiKeyValue = apiKeyValue;
  }

  @action
  setDarkMode(bool value) {
    _appStore.setDarkMode(value);
    useDarkModeValue = value;
  }

  @action
  setPitchBlack(bool value) {
    _appStore.setPitchBlack(value);
    usePitchBlackValue = value;
  }

  @action
  setSystemTheme(bool value) {
    _appStore.setSystemTheme(value);
    themeSetBySystemValue = value;
  }
}
