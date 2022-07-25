import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/share/user_settings.dart';

final showIntoProvider = FutureProvider<bool>((ref) async {
  return UserSettings.shouldShowIntro();
});
