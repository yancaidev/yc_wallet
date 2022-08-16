import 'dart:async';
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yc_wallet/repository/apis/moralis/models/web3_chain.dart';

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
    Web3Chain? chain,
  }) = _Erc20;

  factory Erc20.fromJson(Map<String, dynamic> json) => _$Erc20FromJson(json);
}
