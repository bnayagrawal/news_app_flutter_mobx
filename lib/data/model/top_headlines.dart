import 'package:json_annotation/json_annotation.dart';
import 'article.dart';

part 'top_headlines.g.dart';

@JsonSerializable()
class TopHeadlines {
  TopHeadlines(this.status, this.totalResults, this.articles);

  final String status;
  final int totalResults;
  final List<Article> articles;

  factory TopHeadlines.fromJson(Map<String, dynamic> json) => _$TopHeadlinesFromJson(json);
}
