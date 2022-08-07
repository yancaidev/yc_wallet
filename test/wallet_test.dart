// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'dart:developer' as dev;

import 'package:flutter_test/flutter_test.dart';
import 'package:yc_wallet/features/wallet/wallet_extensions.dart';
import 'package:yc_wallet/features/wallet/wallet_manager.dart';

import 'package:web3dart/credentials.dart' as web3;
import 'package:web3dart/crypto.dart';
import 'package:bip39_mnemonic/bip39_mnemonic.dart';
import 'package:convert/convert.dart';
// import 'package:bip32/bip32.dart' as bip32;

void main() {
  test("generate a new wallet", () {
    const password = "123456";
    final wallet = WalletManager.generateWallet(password);
    final encrypted = wallet.toJson();
    final hexKey = wallet.hexKey;
    final decoder = JsonDecoder();
    try {
      final result = decoder.convert(encrypted);
      assert(result != null, "Generated wallet cannot convert from json.");
    } catch (e) {
      assert(false, "Generate wallet failed. Format error.");
    }
  });

  test("Import a wallet from a hex private key", () {
    const hexKey =
        "1604d928c18a0fbfa2da40c9dec2595b62cc4c6b170dda8d0d0dcc50caa43c99";
    const password = "123456";
    final wallet = WalletManager.fromPrivateKey(hexKey, password: password);
    assert(wallet.hexKey == hexKey, "  hexKey is not the same with hexKey");
  });

  test("Import a wallet from a json", () {
    const password = "123456";
    const hexKey =
        "1604d928c18a0fbfa2da40c9dec2595b62cc4c6b170dda8d0d0dcc50caa43c99";
    const walletJson =
        '{"crypto":{"cipher":"aes-128-ctr","cipherparams":{"iv":"0dbf87c5f5a3489bbebb12cb69768053"},"ciphertext":"21e7bdee23f4d43d8fec44253f2e883980b9ae0eef695f207a6b886837068493","kdf":"scrypt","kdfparams":{"dklen":32,"n":8192,"r":8,"p":1,"salt":"55a18d2867c567df9e5f9a46a5a3824cd21b77fc5540df64ad54d9b5a42d2c46"},"mac":"614d935186f9e57592587c441c2656ca4e13f74799b381e616ce8dfc50ca5b77"},"id":"c9bc4748-c7e2-4e58-9a54-e854315865f2","version":3}';
    try {
      final wallet = web3.Wallet.fromJson(walletJson, password);
      assert(wallet.hexKey == hexKey, "import wallet from json failed");
    } catch (e) {
      dev.log("import wallet from json failed", error: e);
      assert(false, "import wallet from json failed.");
    }
  });
  test("Generate a mnemonic for different length and languages", () {
    // final mnemonic32 = bip39.generateMnemonic(strength: 256);
    // final mnemonic = bip39.generateMnemonic(strength: 24);
    final random = Random.secure();
    // 12位助记词（英文）
    final entropy = List<int>.generate(16, (i) => random.nextInt(256));
    final words12 = Mnemonic(entropy, Language.english);
    dev.log(words12.sentence);
    assert(words12.sentence.split(" ").length == 12,
        "the words' length of the sentence is not 12.");

    // 12位助记词（中文）
    final entropyCn = List<int>.generate(16, (i) => random.nextInt(256));
    final words12Cn = Mnemonic(entropyCn, Language.simplifiedChinese);
    dev.log(words12Cn.sentence);
    assert(words12Cn.sentence.split(" ").length == 12,
        "the words' length of the sentence is not 12.");

    final mnemonic = Mnemonic.generate(Language.simplifiedChinese);
    final chineseSentence = mnemonic.sentence;
    assert(chineseSentence.split(" ").length == 24,
        "the words' length of the sentence is not 24.");

    final englishMnemonic = Mnemonic.generate(Language.english);
    final enSentence = englishMnemonic.sentence;
    assert(enSentence.split(" ").length == 24,
        "the words' length of the sentence is not 24.");
  });

  test("generic a wallet with a 12 words mnemonic.", () {
    final random = Random.secure();
    final entropy = List<int>.generate(16, (i) => random.nextInt(256));
    final mnemonic12 = Mnemonic(entropy, Language.english);
    final seed = mnemonic12.toSeed();
    final hexKey = hex.encode(seed);
    final wallet = WalletManager.fromPrivateKey(hexKey, password: "123456");
    dev.log(wallet.privateKey.address.hex);
  });

  test("generate a mnemonic from a sentence.", () {
    const sentence =
        "learn foil veteran keep sand memory jacket original frog action chuckle myself";
    final mnemonic = Mnemonic.fromSentence(sentence, Language.english);
    final hexKey = hex.encode(mnemonic.toSeed());
    assert(
        hexKey ==
            "4f93b1b42fce631c3d97371d3ebcb65042c40274d76cd247cd172c81a1e99cf71ee512851b0325fbec132a1d2ffb166fd5f784d4f3c128544bc8b61a25e31b6d",
        "hexKey from mnemonic sentence  is not right.");
    final seed = Uint8List.fromList(mnemonic.toSeed());
    // TODO: 使用coinslib 替换BIP32
    // final node = bip32.BIP32.fromSeed(seed);
    // final rootHexKey2 = bytesToHex(node.privateKey);
    // final child = node.derivePath("m/44'/0'/0'/0/0");
    // final hexKey2 = bytesToHex(child.privateKey);

    // dev.log("hexKey2 $hexKey2");
  });

  test("hdwallet.", () {
    const sentence =
        "soldier mechanic sleep gym extend bone bundle price exhaust solar attack whale";
    final mnemonic = Mnemonic.fromSentence(sentence, Language.english);
    // final hexKey = hex.encode(mnemonic.toSeed());
    // assert(
    //     hexKey ==
    //         "4f93b1b42fce631c3d97371d3ebcb65042c40274d76cd247cd172c81a1e99cf71ee512851b0325fbec132a1d2ffb166fd5f784d4f3c128544bc8b61a25e31b6d",
    //     "hexKey from mnemonic sentence  is not right.");
    final seed = Uint8List.fromList(mnemonic.toSeed());

    // TODO: 使用coinslib 替换BIP32
    // final node = bip32.BIP32.fromSeed(seed);

    // /// root private key
    // final rootHexKey2 = bytesToHex(node.privateKey);

    // /// bitcoin child private key, 主网
    // final child = node.derivePath("m/44'/0'/0'/0/0");
    // final bitcoinPrivateKey = child.toWIF();

    // // etherum child private key,
    // // final child = node.derivePath("m/44'/60'/0'/0/0");
    // final hexKey2 = bytesToHex(child.privateKey);
    // child.toBase58();
    // final btcPrivateKey = child.toWIF();

    // final exPair = ECPair.fromWIF(btcPrivateKey);
    // final address =
    //     P2WPKH(data: PaymentData(pubkey: node.publicKey)).data.address;
    // dev.log("address is $address");
    // dev.log("hexKey2 $hexKey2");
  });

  test("async", () async {
    print("1111");
    Future.delayed(Duration(milliseconds: 1000), () {
      print("222");
      return Future.value(100);
    }).then((value) {
      print("333");
    });

    print("4444 ");
  });

  // praise you muffin lion enable neck grocery crumble super myself license ghost
}

// learn foil veteran keep sand memory jacket original frog action chuckle myself
// 4f93b1b42fce631c3d97371d3ebcb65042c40274d76cd247cd172c81a1e99cf71ee512851b0325fbec132a1d2ffb166fd5f784d4f3c128544bc8b61a25e31b6d
// 0x3030e1e4516bd4ed90e5891cefb9973271f40f3d
