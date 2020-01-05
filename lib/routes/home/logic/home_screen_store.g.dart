// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeScreenStore on _HomeScreenStore, Store {
  final _$selectedPageAtom = Atom(name: '_HomeScreenStore.selectedPage');

  @override
  int get selectedPage {
    _$selectedPageAtom.context.enforceReadPolicy(_$selectedPageAtom);
    _$selectedPageAtom.reportObserved();
    return super.selectedPage;
  }

  @override
  set selectedPage(int value) {
    _$selectedPageAtom.context.conditionallyRunInAction(() {
      super.selectedPage = value;
      _$selectedPageAtom.reportChanged();
    }, _$selectedPageAtom, name: '${_$selectedPageAtom.name}_set');
  }

  final _$_HomeScreenStoreActionController =
      ActionController(name: '_HomeScreenStore');

  @override
  dynamic setPage(int pageIndex) {
    final _$actionInfo = _$_HomeScreenStoreActionController.startAction();
    try {
      return super.setPage(pageIndex);
    } finally {
      _$_HomeScreenStoreActionController.endAction(_$actionInfo);
    }
  }
}
