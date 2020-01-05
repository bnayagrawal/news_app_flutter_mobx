import 'package:News/common/preference_service.dart';
import 'package:News/routes/home/pages/topheadlines/logic/top_headlines_service.dart';
import 'package:mobx/mobx.dart';

part 'top_headlines_store.g.dart';

class TopHeadlinesStore = _TopHeadlinesStore with _$TopHeadlinesStore;

abstract class _TopHeadlinesStore with Store {
  TopHeadlinesService _topHeadlinesService;
  PreferenceService _preferenceService;

  _TopHeadlinesStore(this._topHeadlinesService, this._preferenceService);
}
