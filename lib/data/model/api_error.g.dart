// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIError _$APIErrorFromJson(Map<String, dynamic> json) {
  return APIError(
    json['status'] as String,
    json['code'] as String,
    json['message'] as String,
  );
}

Map<String, dynamic> _$APIErrorToJson(APIError instance) => <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
