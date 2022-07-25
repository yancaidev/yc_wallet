import 'package:shared_preferences/shared_preferences.dart';

class UserSettings {
  UserSettings._internal();

  /// 是否显示新特性； true 显示， false 不显示
  static Future<bool> shouldShowIntro() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_UserSettingsKey.showIntro.name) ?? true;
  }

  /// 更新是否显示新特性
  static Future<void> setShowIntro(bool showIntro) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_UserSettingsKey.showIntro.name, showIntro);
  }
}

enum _UserSettingsKey { showIntro }
