import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettings {
  static final shared = UserSettings._internal();

  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

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

  static Future<String?> getPassword() async {
    return await _secureStorage.read(key: _UserSettingsKey.walletPassword.name);
  }

  static Future<bool> isPasswordSetted() async {
    final password = await getPassword();
    return password?.isNotEmpty ?? false;
  }

  static Future<bool> isPasswordRight(String password) async {
    final bytes = utf8.encode(password);
    final encryptedPassword = sha256.convert(bytes).toString();
    final settedPassword = await getPassword();
    return settedPassword == encryptedPassword;
  }
}

enum _UserSettingsKey { showIntro, walletPassword }
