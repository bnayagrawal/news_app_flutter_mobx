
import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class APIError {
  final String status;
  final String code;
  final String message;

  APIError(this.status, this.code, this.message);

  factory APIError.fromJson(Map<String, dynamic> json) => _$APIErrorFromJson(json);
}
