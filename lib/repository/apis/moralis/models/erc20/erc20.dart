import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yc_wallet/extensions/string_ext.dart';
import 'package:yc_wallet/repository/apis/coinmaketcap/model/currency_quote/currency_quote.dart';
import 'package:yc_wallet/repository/apis/coinmaketcap/model/quote/quote.dart';
import 'package:yc_wallet/repository/apis/moralis/models/moralis_chain/moralis_chain.dart';
import 'package:yc_wallet/utils/token_amount_converter.dart';

part 'erc20.freezed.dart';
part 'erc20.g.dart';

@freezed
class Erc20 with _$Erc20 {
  factory Erc20({
    @JsonKey(name: 'token_address') String? tokenAddress,
    String? name,
    String? symbol,
    String? logo,
    String? thumbnail,
    int? decimals,
    String? balance,
    MoralisChain? chain,
    CurrencyQuote? quoteInfo,
    Quote? quote,
  }) = _Erc20;

  factory Erc20.fromJson(Map<String, dynamic> json) => _$Erc20FromJson(json);
}

extension Erc20Ext on Erc20 {
  double? get price => quote?.price;

  bool get hasBalance {
    if (balance == null) return false;
    try {
      return double.parse(balance!) > 0;
    } catch (e) {
      return false;
    }
  }

  String? get amount => weiToAmount(balance, decimals ?? 18, fixed: 8);

  double get total {
    if (price == null || amount == null) return 0;
    return price! * double.parse(amount!);
  }

  String get tokenImage {
    if (StringExt.isNotEmpty(thumbnail)) return thumbnail!;
    if (StringExt.isNotEmpty(logo)) return logo!;
    if (quoteInfo?.id != null) {
      return "https://s2.coinmarketcap.com/static/img/coins/64x64/${quoteInfo!.id!}.png";
    }
    return "https://";
  }
}
