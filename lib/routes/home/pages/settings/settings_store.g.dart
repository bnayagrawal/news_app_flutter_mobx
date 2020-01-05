// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStore, Store {
  final _$apiKeyValueAtom = Atom(name: '_SettingsStore.apiKeyValue');

  @override
  String get apiKeyValue {
    _$apiKeyValueAtom.context.enforceReadPolicy(_$apiKeyValueAtom);
    _$apiKeyValueAtom.reportObserved();
    return super.apiKeyValue;
  }

  @override
  set apiKeyValue(String value) {
    _$apiKeyValueAtom.context.conditionallyRunInAction(() {
      super.apiKeyValue = value;
      _$apiKeyValueAtom.reportChanged();
    }, _$apiKeyValueAtom, name: '${_$apiKeyValueAtom.name}_set');
  }

  final _$useDarkModeValueAtom = Atom(name: '_SettingsStore.useDarkModeValue');

  @override
  bool get useDarkModeValue {
    _$useDarkModeValueAtom.context.enforceReadPolicy(_$useDarkModeValueAtom);
    _$useDarkModeValueAtom.reportObserved();
    return super.useDarkModeValue;
  }

  @override
  set useDarkModeValue(bool value) {
    _$useDarkModeValueAtom.context.conditionallyRunInAction(() {
      super.useDarkModeValue = value;
      _$useDarkModeValueAtom.reportChanged();
    }, _$useDarkModeValueAtom, name: '${_$useDarkModeValueAtom.name}_set');
  }

  final _$themeSetBySystemValueAtom =
      Atom(name: '_SettingsStore.themeSetBySystemValue');

  @override
  bool get themeSetBySystemValue {
    _$themeSetBySystemValueAtom.context
        .enforceReadPolicy(_$themeSetBySystemValueAtom);
    _$themeSetBySystemValueAtom.reportObserved();
    return super.themeSetBySystemValue;
  }

  @override
  set themeSetBySystemValue(bool value) {
    _$themeSetBySystemValueAtom.context.conditionallyRunInAction(() {
      super.themeSetBySystemValue = value;
      _$themeSetBySystemValueAtom.reportChanged();
    }, _$themeSetBySystemValueAtom,
        name: '${_$themeSetBySystemValueAtom.name}_set');
  }

  final _$messageAtom = Atom(name: '_SettingsStore.message');

  @override
  String get message {
    _$messageAtom.context.enforceReadPolicy(_$messageAtom);
    _$messageAtom.reportObserved();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.context.conditionallyRunInAction(() {
      super.message = value;
      _$messageAtom.reportChanged();
    }, _$messageAtom, name: '${_$messageAtom.name}_set');
  }

  final _$_SettingsStoreActionController =
      ActionController(name: '_SettingsStore');

  @override
  dynamic setNonValidatedApiKey(String value) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction();
    try {
      return super.setNonValidatedApiKey(value);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setApiKey() {
    final _$actionInfo = _$_SettingsStoreActionController.startAction();
    try {
      return super.setApiKey();
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDarkMode(bool value) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction();
    try {
      return super.setDarkMode(value);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSystemTheme(bool value) {
    final _$actionInfo = _$_SettingsStoreActionController.startAction();
    try {
      return super.setSystemTheme(value);
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }
}
