import 'package:News/common/preference_service.dart';
import 'package:News/data/api.dart';
import 'package:News/data/model/api_error.dart';
import 'package:News/data/model/top_headlines.dart';
import 'package:News/routes/home/pages/pages.dart';
import 'package:News/routes/home/pages/topheadlines/logic/top_headlines_service.dart';
import 'package:mobx/mobx.dart';

part 'top_headlines_store.g.dart';

class TopHeadlinesStore = _TopHeadlinesStore with _$TopHeadlinesStore;

abstract class _TopHeadlinesStore with Store {
  TopHeadlinesService _topHeadlinesService;
  PreferenceService _preferenceService;

  _TopHeadlinesStore(this._topHeadlinesService, this._preferenceService) {
    _fetchTopHeadlines();
  }

  @observable
  TopHeadlines topHeadlines;

  @observable
  bool isLoading = false;

  @observable
  APIError apiError;

  @observable
  String error;

  @observable
  MenuItem view = MenuItem.LIST_VIEW;

  @observable
  NewsCategory category = NewsCategory.all;

  @action
  _fetchTopHeadlines() async {
    try {
      isLoading = true;
      topHeadlines = await _topHeadlinesService.getTopHeadlines(
        _preferenceService.apiKey,
        newsCategory: category,
      );
    } on APIError catch (apiError) {
      this.apiError = apiError;
    } on Exception catch (e) {
      this.error = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  setView(MenuItem value) {
    view = value;
  }

  @action
  setNewsCategory(NewsCategory category) {
    if(category != this.category) {
      this.category = category;
      _fetchTopHeadlines();
    }
  }
}
