// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrencyQuote _$$_CurrencyQuoteFromJson(Map<String, dynamic> json) =>
    _$_CurrencyQuote(
      id: json['id'] as int?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      slug: json['slug'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      platform: json['platform'] == null
          ? null
          : Platform.fromJson(json['platform'] as Map<String, dynamic>),
      quote: (json['quote'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Quote.fromJson(e as Map<String, dynamic>)),
      ),
      numMarketPairs: json['num_market_pairs'] as int?,
      dateAdded: json['date_added'] == null
          ? null
          : DateTime.parse(json['date_added'] as String),
      maxSupply: json['max_supply'] as int?,
      circulatingSupply: (json['circulating_supply'] as num?)?.toDouble(),
      totalSupply: (json['total_supply'] as num?)?.toDouble(),
      isActive: json['is_active'] as int?,
      cmcRank: json['cmc_rank'] as int?,
      isFiat: json['is_fiat'] as int?,
      selfReportedCirculatingSupply: json['self_reported_circulating_supply'],
      selfReportedMarketCap: json['self_reported_market_cap'],
      tvlRatio: json['tvl_ratio'],
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$$_CurrencyQuoteToJson(_$_CurrencyQuote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'slug': instance.slug,
      'tags': instance.tags,
      'platform': instance.platform,
      'quote': instance.quote,
      'num_market_pairs': instance.numMarketPairs,
      'date_added': instance.dateAdded?.toIso8601String(),
      'max_supply': instance.maxSupply,
      'circulating_supply': instance.circulatingSupply,
      'total_supply': instance.totalSupply,
      'is_active': instance.isActive,
      'cmc_rank': instance.cmcRank,
      'is_fiat': instance.isFiat,
      'self_reported_circulating_supply':
          instance.selfReportedCirculatingSupply,
      'self_reported_market_cap': instance.selfReportedMarketCap,
      'tvl_ratio': instance.tvlRatio,
      'last_updated': instance.lastUpdated?.toIso8601String(),
    };
