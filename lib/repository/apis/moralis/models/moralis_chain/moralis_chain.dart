import 'package:yc_wallet/share/freezed_import.dart';

part 'moralis_chain.freezed.dart';
part 'moralis_chain.g.dart';

@freezed
class MoralisChain with _$MoralisChain {
  /// Moralis 主链名称
  static const eth = "eth";
  static const ethTest = "ropsten";
  static const bsc = "bsc";
  static const bscTest = "bsc testnet";

  static final ethChain = MoralisChain(
      name: eth,
      symbol: "ETH",
      tokenName: "Ether",
      decimals: 18,
      marketCapPlatformName: "Ethereum");

  static final ethTestChain = MoralisChain(
      name: ethTest,
      symbol: "ETH",
      tokenName: "Ether",
      decimals: 18,
      marketCapPlatformName: "Ethereum");

  static final bscChain = MoralisChain(
      name: bsc,
      symbol: "BNB",
      tokenName: "Binance Coin",
      decimals: 18,
      marketCapPlatformName: "BNB");

  static final bscTestChain = MoralisChain(
      name: bscTest,
      symbol: "BNB",
      tokenName: "Binance Coin",
      decimals: 18,
      marketCapPlatformName: "BNB");

  factory MoralisChain({
    required String name,
    required int decimals,
    required String marketCapPlatformName,
    String? tokenName,
    String? symbol,
    String? logo,
    String? thumbnail,
  }) = _MoralisChain;

  factory MoralisChain.fromJson(Map<String, dynamic> json) =>
      _$MoralisChainFromJson(json);
}
