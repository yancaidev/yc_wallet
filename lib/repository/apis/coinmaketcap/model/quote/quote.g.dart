// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Quote _$$_QuoteFromJson(Map<String, dynamic> json) => _$_Quote(
      price: (json['price'] as num?)?.toDouble(),
      volume24h: (json['volume_24h'] as num?)?.toDouble(),
      volumeChange24h: (json['volume_change_24h'] as num?)?.toDouble(),
      percentChange1h: (json['percent_change_1h'] as num?)?.toDouble(),
      percentChange24h: (json['percent_change_24h'] as num?)?.toDouble(),
      percentChange7d: (json['percent_change_7d'] as num?)?.toDouble(),
      percentChange30d: (json['percent_change_30d'] as num?)?.toDouble(),
      percentChange60d: (json['percent_change_60d'] as num?)?.toDouble(),
      percentChange90d: (json['percent_change_90d'] as num?)?.toDouble(),
      marketCap: (json['market_cap'] as num?)?.toDouble(),
      marketCapDominance: (json['market_cap_dominance'] as num?)?.toDouble(),
      fullyDilutedMarketCap:
          (json['fully_diluted_market_cap'] as num?)?.toDouble(),
      tvl: json['tvl'],
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$$_QuoteToJson(_$_Quote instance) => <String, dynamic>{
      'price': instance.price,
      'volume_24h': instance.volume24h,
      'volume_change_24h': instance.volumeChange24h,
      'percent_change_1h': instance.percentChange1h,
      'percent_change_24h': instance.percentChange24h,
      'percent_change_7d': instance.percentChange7d,
      'percent_change_30d': instance.percentChange30d,
      'percent_change_60d': instance.percentChange60d,
      'percent_change_90d': instance.percentChange90d,
      'market_cap': instance.marketCap,
      'market_cap_dominance': instance.marketCapDominance,
      'fully_diluted_market_cap': instance.fullyDilutedMarketCap,
      'tvl': instance.tvl,
      'last_updated': instance.lastUpdated?.toIso8601String(),
    };
