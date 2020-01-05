// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
  final _$apiKeyAtom = Atom(name: '_AppStore.apiKey');

  @override
  String get apiKey {
    _$apiKeyAtom.context.enforceReadPolicy(_$apiKeyAtom);
    _$apiKeyAtom.reportObserved();
    return super.apiKey;
  }

  @override
  set apiKey(String value) {
    _$apiKeyAtom.context.conditionallyRunInAction(() {
      super.apiKey = value;
      _$apiKeyAtom.reportChanged();
    }, _$apiKeyAtom, name: '${_$apiKeyAtom.name}_set');
  }

  final _$useDarkModeAtom = Atom(name: '_AppStore.useDarkMode');

  @override
  bool get useDarkMode {
    _$useDarkModeAtom.context.enforceReadPolicy(_$useDarkModeAtom);
    _$useDarkModeAtom.reportObserved();
    return super.useDarkMode;
  }

  @override
  set useDarkMode(bool value) {
    _$useDarkModeAtom.context.conditionallyRunInAction(() {
      super.useDarkMode = value;
      _$useDarkModeAtom.reportChanged();
    }, _$useDarkModeAtom, name: '${_$useDarkModeAtom.name}_set');
  }

  final _$themeSetBySystemAtom = Atom(name: '_AppStore.themeSetBySystem');

  @override
  bool get themeSetBySystem {
    _$themeSetBySystemAtom.context.enforceReadPolicy(_$themeSetBySystemAtom);
    _$themeSetBySystemAtom.reportObserved();
    return super.themeSetBySystem;
  }

  @override
  set themeSetBySystem(bool value) {
    _$themeSetBySystemAtom.context.conditionallyRunInAction(() {
      super.themeSetBySystem = value;
      _$themeSetBySystemAtom.reportChanged();
    }, _$themeSetBySystemAtom, name: '${_$themeSetBySystemAtom.name}_set');
  }

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  dynamic setApiKey(String newApiKey) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setApiKey(newApiKey);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDarkMode(bool value) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setDarkMode(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSystemTheme(bool value) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setSystemTheme(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }
}
