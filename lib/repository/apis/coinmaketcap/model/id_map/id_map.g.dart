// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_IdMap _$$_IdMapFromJson(Map<String, dynamic> json) => _$_IdMap(
      id: json['id'] as int?,
      rank: json['rank'] as int?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      slug: json['slug'] as String?,
      platform: json['platform'] == null
          ? null
          : Platform.fromJson(json['platform'] as Map<String, dynamic>),
      isActive: json['is_active'] as int?,
      firstHistoricalData: json['first_historical_data'] == null
          ? null
          : DateTime.parse(json['first_historical_data'] as String),
      lastHistoricalData: json['last_historical_data'] == null
          ? null
          : DateTime.parse(json['last_historical_data'] as String),
    );

Map<String, dynamic> _$$_IdMapToJson(_$_IdMap instance) => <String, dynamic>{
      'id': instance.id,
      'rank': instance.rank,
      'name': instance.name,
      'symbol': instance.symbol,
      'slug': instance.slug,
      'platform': instance.platform,
      'is_active': instance.isActive,
      'first_historical_data': instance.firstHistoricalData?.toIso8601String(),
      'last_historical_data': instance.lastHistoricalData?.toIso8601String(),
    };
