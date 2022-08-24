import 'package:freezed_annotation/freezed_annotation.dart';

part 'quote.freezed.dart';
part 'quote.g.dart';

@freezed
class Quote with _$Quote {
  factory Quote({
    double? price,
    @JsonKey(name: 'volume_24h') double? volume24h,
    @JsonKey(name: 'volume_change_24h') double? volumeChange24h,
    @JsonKey(name: 'percent_change_1h') double? percentChange1h,
    @JsonKey(name: 'percent_change_24h') double? percentChange24h,
    @JsonKey(name: 'percent_change_7d') double? percentChange7d,
    @JsonKey(name: 'percent_change_30d') double? percentChange30d,
    @JsonKey(name: 'percent_change_60d') double? percentChange60d,
    @JsonKey(name: 'percent_change_90d') double? percentChange90d,
    @JsonKey(name: 'market_cap') double? marketCap,
    @JsonKey(name: 'market_cap_dominance') double? marketCapDominance,
    @JsonKey(name: 'fully_diluted_market_cap') double? fullyDilutedMarketCap,
    dynamic tvl,
    @JsonKey(name: 'last_updated') DateTime? lastUpdated,
  }) = _Quote;

  factory Quote.fromJson(Map<String, dynamic> json) => _$QuoteFromJson(json);
}
