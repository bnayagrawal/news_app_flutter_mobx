import 'package:json_annotation/json_annotation.dart';

part 'sources.g.dart';

@JsonSerializable()
class Sources {
  final String status;
  final List<Publisher> sources;

  Sources(this.status, this.sources);

  factory Sources.fromJson(Map<String, dynamic> json) => _$SourcesFromJson(json);
}

@JsonSerializable()
class Publisher {
  final String id;
  final String url;
  final String category;
  final String language;
  final String country;

  Publisher(this.id, this.url, this.category, this.language, this.country);

  factory Publisher.fromJson(Map<String, dynamic> json) => _$PublisherFromJson(json);
}
