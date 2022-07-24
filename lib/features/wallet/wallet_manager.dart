import 'dart:math';

import 'package:web3dart/web3dart.dart';
// import 'package:bip39/bip39.dart' as bip39;

class WalletManager {
  // static Wallet newMnemonicWallet(String password) {

  //   final mnemonic =  bip39.generateMnemonic(strength: 256);
  //   return
  // }

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
