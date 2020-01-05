// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sources _$SourcesFromJson(Map<String, dynamic> json) {
  return Sources(
    json['status'] as String,
    (json['sources'] as List)
        ?.map((e) =>
            e == null ? null : Publisher.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SourcesToJson(Sources instance) => <String, dynamic>{
      'status': instance.status,
      'sources': instance.sources,
    };

Publisher _$PublisherFromJson(Map<String, dynamic> json) {
  return Publisher(
    json['id'] as String,
    json['url'] as String,
    json['category'] as String,
    json['language'] as String,
    json['country'] as String,
  );
}

Map<String, dynamic> _$PublisherToJson(Publisher instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'category': instance.category,
      'language': instance.language,
      'country': instance.country,
    };
