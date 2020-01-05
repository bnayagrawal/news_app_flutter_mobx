import 'package:News/data/model/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'everything.g.dart';

@JsonSerializable()
class Everything {
  final String status;
  final int totalResults;
  final List<Article> articles;

  Everything(this.status, this.totalResults, this.articles);

  factory Everything.fromJson(Map<String, dynamic> json) => _$EverythingFromJson(json);
}
