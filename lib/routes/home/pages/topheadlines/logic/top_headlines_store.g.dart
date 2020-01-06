// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_headlines_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TopHeadlinesStore on _TopHeadlinesStore, Store {
  final _$newsDataAtom = Atom(name: '_TopHeadlinesStore.newsData');

  @override
  Map<NewsCategory, TopHeadlines> get newsData {
    _$newsDataAtom.context.enforceReadPolicy(_$newsDataAtom);
    _$newsDataAtom.reportObserved();
    return super.newsData;
  }

  @override
  set newsData(Map<NewsCategory, TopHeadlines> value) {
    _$newsDataAtom.context.conditionallyRunInAction(() {
      super.newsData = value;
      _$newsDataAtom.reportChanged();
    }, _$newsDataAtom, name: '${_$newsDataAtom.name}_set');
  }

  final _$loadingStatusAtom = Atom(name: '_TopHeadlinesStore.loadingStatus');

  @override
  Map<NewsCategory, bool> get loadingStatus {
    _$loadingStatusAtom.context.enforceReadPolicy(_$loadingStatusAtom);
    _$loadingStatusAtom.reportObserved();
    return super.loadingStatus;
  }

  @override
  set loadingStatus(Map<NewsCategory, bool> value) {
    _$loadingStatusAtom.context.conditionallyRunInAction(() {
      super.loadingStatus = value;
      _$loadingStatusAtom.reportChanged();
    }, _$loadingStatusAtom, name: '${_$loadingStatusAtom.name}_set');
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

  final _$fetchTopHeadlinesAsyncAction = AsyncAction('fetchTopHeadlines');

  @override
  Future fetchTopHeadlines(NewsCategory category) {
    return _$fetchTopHeadlinesAsyncAction
        .run(() => super.fetchTopHeadlines(category));
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
