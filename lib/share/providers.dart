import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/repository/database/wallet_database.dart';
import 'package:yc_wallet/share/user_settings.dart';

import 'app_state.dart';

/// 应用初始状态
final appStateProvider = StateProvider<AppState>((ref) => AppState());

/// 数据库
final databaseProvider = Provider((ref) => WalletDatabase());

/// 钱包数据库操作
final walletInfoDaoProvider =
    Provider((ref) => ref.watch(databaseProvider).walletInfoDao);

/// 异步获取应用的初始化状态
final prepareAppStateProvider = FutureProvider<AppState>((ref) async {
  final currentWallet =
      await ref.read(walletInfoDaoProvider).findCurrentWallet();
  final showIntro = currentWallet == null;
  await UserSettings.setShowIntro(showIntro);
  final walletPasswordSetted = await UserSettings.isPasswordSetted();
  return AppState(
      showIntro: showIntro,
      isWalletPasswordSetted: walletPasswordSetted,
      currentWallet: currentWallet);
});
