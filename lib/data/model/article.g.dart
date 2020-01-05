// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return Article(
    json['source'] == null
        ? null
        : ArticleSource.fromJson(json['source'] as Map<String, dynamic>),
    json['author'] as String,
    json['title'] as String,
    json['description'] as String,
    json['url'] as String,
    json['urlToImage'] as String,
    json['publishedAt'] as String,
    json['content'] as String,
  );
}

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };

ArticleSource _$ArticleSourceFromJson(Map<String, dynamic> json) {
  return ArticleSource(
    json['id'] as String,
    json['author'] as String,
  );
}

Map<String, dynamic> _$ArticleSourceToJson(ArticleSource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
    };
