import 'dart:math';

import 'package:bip39_mnemonic/bip39_mnemonic.dart';
import 'package:web3dart/web3dart.dart';

class WalletManager {
  // static Wallet newMnemonicWallet(String password) {

  //   final mnemonic =  bip39.generateMnemonic(strength: 256);
  //   return
  // }

  WalletManager._internal();

  static String generateMnemonic(int wordsCount) {
    if (wordsCount == 24) {
      return Mnemonic.generate(Language.english).sentence;
    }
    final random = Random.secure();
    final entropy = List<int>.generate(16, (i) => random.nextInt(256));
    return Mnemonic(entropy, Language.english).sentence;
  }

  static List<String> generateMnemonicWords(int wordsCount) {
    return generateMnemonic(12).split(" ");
  }

  static Wallet generateWallet(String password) {
    Random random = Random.secure();
    EthPrivateKey privateKey = EthPrivateKey.createRandom(random);
    return Wallet.createNew(privateKey, password, random);
  }

  static Wallet? from({required String hexKey, required String password}) {
    EthPrivateKey privateKey = EthPrivateKey.fromHex(hexKey);
    return Wallet.createNew(privateKey, password, Random.secure());
  }
}
