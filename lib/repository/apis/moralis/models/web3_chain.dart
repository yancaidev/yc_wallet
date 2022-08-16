import 'package:yc_wallet/share/freezed_import.dart';
part 'web3_chain.freezed.dart';
part 'web3_chain.g.dart';

@freezed
class Web3Chain with _$Web3Chain {
  factory Web3Chain({
    required ChainType chainType,
    required String name,
    String? symbol,
    String? logo,
    String? thumbnail,
  }) = _Web3Chain;

  factory Web3Chain.fromJson(Map<String, dynamic> json) =>
      _$Web3ChainFromJson(json);

  static const eth = "eth";
  static const ethTest = "ropsten";
  static const bsc = "bsc";
  static const bscTest = "bsc test";
}

enum ChainType {
  eth,
  ethTest,
  bsc,
  bscTest;
}
