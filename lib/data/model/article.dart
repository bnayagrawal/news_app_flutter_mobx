import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  final ArticleSource source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  Article(this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt,
      this.content);

  factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
}

@JsonSerializable()
class ArticleSource {
  final String id;
  final String name;

  ArticleSource(this.id, this.name);

  factory ArticleSource.fromJson(Map<String, dynamic> json) => _$ArticleSourceFromJson(json);
}
