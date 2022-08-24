import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yc_wallet/repository/apis/coinmaketcap/model/platform/platform.dart';
import 'package:yc_wallet/repository/apis/coinmaketcap/model/quote/quote.dart';
import 'package:yc_wallet/repository/apis/coinmaketcap/model/tag/tag.dart';

part 'currency_quote.freezed.dart';
part 'currency_quote.g.dart';

@freezed
class CurrencyQuote with _$CurrencyQuote {
  factory CurrencyQuote({
    int? id,
    String? name,
    String? symbol,
    String? slug,
    List<Tag>? tags,
    Platform? platform,
    Map<String, Quote>? quote,
    @JsonKey(name: 'num_market_pairs') int? numMarketPairs,
    @JsonKey(name: 'date_added') DateTime? dateAdded,
    @JsonKey(name: 'max_supply') int? maxSupply,
    @JsonKey(name: 'circulating_supply') double? circulatingSupply,
    @JsonKey(name: 'total_supply') double? totalSupply,
    @JsonKey(name: 'is_active') int? isActive,
    @JsonKey(name: 'cmc_rank') int? cmcRank,
    @JsonKey(name: 'is_fiat') int? isFiat,
    @JsonKey(name: 'self_reported_circulating_supply')
        dynamic selfReportedCirculatingSupply,
    @JsonKey(name: 'self_reported_market_cap') dynamic selfReportedMarketCap,
    @JsonKey(name: 'tvl_ratio') dynamic tvlRatio,
    @JsonKey(name: 'last_updated') DateTime? lastUpdated,
  }) = _CurrencyQuote;

  factory CurrencyQuote.fromJson(Map<String, dynamic> json) =>
      _$CurrencyQuoteFromJson(json);
}
