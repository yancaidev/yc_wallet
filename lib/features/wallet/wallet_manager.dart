import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:bip39_mnemonic/bip39_mnemonic.dart';
import 'package:coinslib/coinslib.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3dart/web3dart.dart' as web3;
import 'package:yc_wallet/features/wallet/wallet_extensions.dart';
import 'package:yc_wallet/model/simple_exception.dart';
import 'package:yc_wallet/model/wallet_type.dart';
import 'package:yc_wallet/share/quick_import.dart';
import 'package:yc_wallet/share/user_settings.dart';

class WalletManager {
  static final WalletManager shared = WalletManager._internal();

  late web3.Wallet? _currentWallet;

  WalletManager._internal();

  /// 获取当前的钱包
  Future<web3.Wallet?> getCurrentWallet(String password) async {
    if (_currentWallet != null) {
      return _currentWallet;
    }
    final defaultWalletJson = await UserSettings.shared.getDefaultWallet();
    if (defaultWalletJson == null) {
      return null;
    }
    _currentWallet = web3.Wallet.fromJson(defaultWalletJson, password);
    return _currentWallet;
  }

  /// 设置当前选中的钱包
  void setCurrentWallet(web3.Wallet wallet) {
    _currentWallet = wallet;
  }

  /// 添加钱包
  Future addWallet(web3.Wallet wallet) async {
    await UserSettings.shared.saveWallet(wallet.hexAddress, wallet.toJson());
  }

  /// 移除钱包
  Future removeWallet(String hexAddress) async {
    await UserSettings.shared.removeWallet(hexAddress);
  }

  /// 所有的钱包列表
  Future<List<String>> get allWalletsAddresses async {
    return await UserSettings.shared.allWalletsAddresses();
  }

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

  static web3.Wallet generateWallet(String password) {
    Random random = Random.secure();
    EthPrivateKey privateKey = EthPrivateKey.createRandom(random);
    return web3.Wallet.createNew(privateKey, password, random);
  }

  static web3.Wallet fromPrivateKey(String hexKey, {required String password}) {
    EthPrivateKey privateKey = EthPrivateKey.fromHex(hexKey);
    return web3.Wallet.createNew(privateKey, password, Random.secure());
  }

  static web3.Wallet fromMnemonic(List<String> words, String password) {
    if (words.length == 12 || words.length == 24) {
      final mnemonic = Mnemonic.fromSentence(words.join(" "), Language.english);
      final seed = Uint8List.fromList(mnemonic.toSeed());
      final bip32 = BIP32.fromSeed(seed);
      final privateKeyList = bip32.privateKey;
      if (privateKeyList == null) {
        throw Exception("wallet generated failed");
      }
      final privateKey = bytesToHex(privateKeyList);
      final wallet = fromPrivateKey(privateKey, password: password);
      return wallet;
    }
    throw UnsupportedError("仅支持12位、14位英文助记词");
  }

  static web3.Wallet fromWalletType(
      {required WalletType walletType, required String password}) {
    web3.Wallet? wallet;
    String errorMsg = "助记词不正确";
    try {
      walletType.when(privateKey: (privateKey) {
        wallet = fromPrivateKey(privateKey, password: password);
        errorMsg = "私钥不正确";
      }, mnemonic12: (mnemonic12) {
        wallet = fromMnemonic(mnemonic12, password);
      }, mnemonic24: (mnemonic24) {
        wallet = fromMnemonic(mnemonic24, password);
      }, json: (encoded) {
        wallet = web3.Wallet.fromJson(json.encode(encoded), password);
        errorMsg = "钱包json不正确";
      });
    } catch (e) {
      Log.e("钱包导出异常", e);
      throw SimpleException(errorMsg, e);
    }
    return wallet!;
  }

  web3.Wallet saveUnbackupedMnemonicWallet(
      List<String> words, String password) {
    if (words.length == 12 || words.length == 24) {
      final mnemonic = Mnemonic.fromSentence(words.join(" "), Language.english);
      final seed = Uint8List.fromList(mnemonic.toSeed());
      final bip32 = BIP32.fromSeed(seed);
      final privateKeyList = bip32.privateKey;
      if (privateKeyList == null) {
        throw Exception("wallet generated failed");
      }
      final privateKey = bytesToHex(privateKeyList);
      final wallet = fromPrivateKey(privateKey, password: password);
      return wallet;
    }
    throw UnsupportedError("仅支持12位、14位英文助记词");
  }
}
