// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_headlines_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TopHeadlinesStore on _TopHeadlinesStore, Store {
  final _$topHeadlinesAtom = Atom(name: '_TopHeadlinesStore.topHeadlines');

  @override
  TopHeadlines get topHeadlines {
    _$topHeadlinesAtom.context.enforceReadPolicy(_$topHeadlinesAtom);
    _$topHeadlinesAtom.reportObserved();
    return super.topHeadlines;
  }

  @override
  set topHeadlines(TopHeadlines value) {
    _$topHeadlinesAtom.context.conditionallyRunInAction(() {
      super.topHeadlines = value;
      _$topHeadlinesAtom.reportChanged();
    }, _$topHeadlinesAtom, name: '${_$topHeadlinesAtom.name}_set');
  }

  final _$isLoadingAtom = Atom(name: '_TopHeadlinesStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$apiErrorAtom = Atom(name: '_TopHeadlinesStore.apiError');

  @override
  APIError get apiError {
    _$apiErrorAtom.context.enforceReadPolicy(_$apiErrorAtom);
    _$apiErrorAtom.reportObserved();
    return super.apiError;
  }

  @override
  set apiError(APIError value) {
    _$apiErrorAtom.context.conditionallyRunInAction(() {
      super.apiError = value;
      _$apiErrorAtom.reportChanged();
    }, _$apiErrorAtom, name: '${_$apiErrorAtom.name}_set');
  }

  final _$errorAtom = Atom(name: '_TopHeadlinesStore.error');

  @override
  String get error {
    _$errorAtom.context.enforceReadPolicy(_$errorAtom);
    _$errorAtom.reportObserved();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.context.conditionallyRunInAction(() {
      super.error = value;
      _$errorAtom.reportChanged();
    }, _$errorAtom, name: '${_$errorAtom.name}_set');
  }

  final _$viewAtom = Atom(name: '_TopHeadlinesStore.view');

  @override
  MenuItem get view {
    _$viewAtom.context.enforceReadPolicy(_$viewAtom);
    _$viewAtom.reportObserved();
    return super.view;
  }

  @override
  set view(MenuItem value) {
    _$viewAtom.context.conditionallyRunInAction(() {
      super.view = value;
      _$viewAtom.reportChanged();
    }, _$viewAtom, name: '${_$viewAtom.name}_set');
  }

  final _$_fetchTopHeadlinesAsyncAction = AsyncAction('_fetchTopHeadlines');

  @override
  Future _fetchTopHeadlines() {
    return _$_fetchTopHeadlinesAsyncAction
        .run(() => super._fetchTopHeadlines());
  }

  final _$_TopHeadlinesStoreActionController =
      ActionController(name: '_TopHeadlinesStore');

  @override
  dynamic setView(MenuItem value) {
    final _$actionInfo = _$_TopHeadlinesStoreActionController.startAction();
    try {
      return super.setView(value);
    } finally {
      _$_TopHeadlinesStoreActionController.endAction(_$actionInfo);
    }
  }
}
