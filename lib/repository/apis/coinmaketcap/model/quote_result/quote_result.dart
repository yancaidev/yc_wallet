import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yc_wallet/repository/apis/coinmaketcap/model/currency_quote/currency_quote.dart';
import 'package:yc_wallet/repository/apis/coinmaketcap/model/result/result_status/result_status.dart';

part 'quote_result.freezed.dart';
part 'quote_result.g.dart';

@freezed
class QuoteResult with _$QuoteResult {
  factory QuoteResult(
      {Map<String, List<CurrencyQuote>>? data,
      ResultStatus? status}) = _QuoteResult;

  factory QuoteResult.fromJson(Map<String, dynamic> json) =>
      _$QuoteResultFromJson(json);
}
