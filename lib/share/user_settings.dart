import 'dart:collection';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettings {
  static final shared = UserSettings._internal();

  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Map<String, String>? _allWallets;

  UserSettings._internal();

  /// 是否显示新特性； true 显示， false 不显示
  static Future<bool> shouldShowIntro() async {
    final prefs = await SharedPreferences.getInstance();
    // return true;
    return prefs.getBool(_UserSettingsKey.showIntro.name) ?? true;
  }

  /// 更新是否显示新特性
  static Future<void> setShowIntro(bool showIntro) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_UserSettingsKey.showIntro.name, showIntro);
  }

  /// 保存密码
  static Future<void> setWalletPassword(String password) async {
    final bytes = utf8.encode(password);
    final encryptedPassword = sha256.convert(bytes).toString();
    return await _secureStorage.write(
        key: _UserSettingsKey.walletPassword.name, value: encryptedPassword);
  }

  /// 获取缓存在本地加密后的密码
  static Future<String?> getPassword() async {
    return await _secureStorage.read(key: _UserSettingsKey.walletPassword.name);
  }

  /// 是否设置了钱包
  static Future<bool> isPasswordSetted() async {
    final password = await getPassword();
    return password?.isNotEmpty ?? false;
  }

  /// 是否是正确的钱包
  static Future<bool> isPasswordRight(String password) async {
    final bytes = utf8.encode(password);
    final encryptedPassword = sha256.convert(bytes).toString();
    final settedPassword = await getPassword();
    return settedPassword == encryptedPassword;
  }

  /// 获取所有缓存在本地的钱包
  Future<Map<String, String>?> getWallets() async {
    if (_allWallets == null) {
      final walletsJson =
          await _secureStorage.read(key: _UserSettingsKey.allWallets.name);
      if (walletsJson == null) {
        return null;
      }
      final receiver = HashMap<String, String>();
      _allWallets = jsonDecode(walletsJson, reviver: (key, value) {
        if (key != null) {
          receiver[key as String] = value as String;
        }
        return receiver;
      });
    }
    return _allWallets;
  }

  /// 获取本地中所有钱包的地址,按照地址排序
  Future<List<String>> allWalletsAddresses() async {
    final wallets = await getWallets();
    final allKeys = wallets?.keys.toList() ?? List<String>.of([]);
    allKeys.sort((a1, a2) => a1.compareTo(a2));
    return allKeys;
  }

  /// 根据地址获取钱包中
  Future<String?> getWalletWithAddress(String address) async {
    final allWallets = await getWallets();
    return allWallets?[address];
  }

  /// 缓存钱包信息到本地
  /// - key 为钱包地址
  /// - value 为钱包加密后的json数据
  Future saveWallets(Map<String, String> walletsJson) async {
    final walletJsonStr = jsonEncode(walletsJson);
    await _secureStorage.write(
        key: _UserSettingsKey.allWallets.name, value: walletJsonStr);
  }

  /// 新增钱包
  Future saveWallet(String address, String walletJsonStr) async {
    final allWallets = (await getWallets()) ?? HashMap<String, String>();
    allWallets[address] = walletJsonStr;
    await saveWallets(allWallets);
  }

  /// 移除钱包
  Future removeWallet(String address) async {
    final allWallets = (await getWallets()) ?? HashMap<String, String>();
    allWallets.remove(address);
    await saveWallets(allWallets);
  }

  /// 设置默认钱包
  Future setDefaultWalletAddress(String address) async {
    await _secureStorage.write(
        key: _UserSettingsKey.defaultWallet.name, value: address);
  }

  /// 获取默认钱包
  Future<String?> getDefaultWallet() async {
    final address =
        await _secureStorage.read(key: _UserSettingsKey.defaultWallet.name);
    if (address == null) return null;
    return await getWalletWithAddress(address);
  }
}

enum _UserSettingsKey { showIntro, walletPassword, allWallets, defaultWallet }
