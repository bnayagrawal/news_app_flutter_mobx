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
    themeSetBySystemValue = _appStore.themeSetBySystem;
  }

  @observable
  String apiKeyValue;

  @observable
  bool useDarkModeValue;

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
  setSystemTheme(bool value) {
    _appStore.setSystemTheme(value);
    themeSetBySystemValue = value;
  }
}
