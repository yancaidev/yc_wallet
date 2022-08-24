// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListResult<T> _$ListResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ListResult<T>(
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
      status: json['status'] == null
          ? null
          : ResultStatus.fromJson(json['status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListResultToJson<T>(
  ListResult<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': instance.data?.map(toJsonT).toList(),
      'status': instance.status,
    };
