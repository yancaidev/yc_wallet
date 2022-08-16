import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_type.freezed.dart';

@freezed
class WalletType with _$WalletType {
  const factory WalletType.privateKey({required String privateKey}) =
      PrivateKey;
  const factory WalletType.mnemonic12({required List<String> words}) =
      Mnemonic12;
  const factory WalletType.mnemonic24({required List<String> words}) =
      Mnemonic24;
  const factory WalletType.json({required Map<String, Object> json}) =
      WalletJson;

  static WalletType fromMnemonicWords(List<String> words) {
    return words.length == 12
        ? WalletType.mnemonic12(words: words)
        : WalletType.mnemonic24(words: words);
  }
}
