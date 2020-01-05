// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'everything.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Everything _$EverythingFromJson(Map<String, dynamic> json) {
  return Everything(
    json['status'] as String,
    json['totalResults'] as int,
    (json['articles'] as List)
        ?.map((e) =>
            e == null ? null : Article.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EverythingToJson(Everything instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
