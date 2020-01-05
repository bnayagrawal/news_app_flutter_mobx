import 'package:News/data/api.dart' as Api;
import 'package:News/data/model/top_headlines.dart';

class TopHeadlinesService {

  Future<TopHeadlines> getTopHeadlines(String apiKey, {Api.NewsCategory newsCategory}) async {
    return await Api.getTopHeadlines(apiKey, category: newsCategory);
  }
}