import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_wallet/repository/apis/moralis/moralis_api.dart';
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

final prepareAppStateProvider = FutureProvider<AppState>((ref) async {
  MoralisApi.shared.setupClient(
      apiKey:
          "qCyozPfc6y8GEhbxkxnHMe6cykyTm6mAdejTLq21LKwrTqMf539Ag75lDJQRCtOI");
  final currentWallet =
      await ref.read(walletInfoDaoProvider).findCurrentWallet();
  final showIntro = currentWallet == null;
  await UserSettings.setShowIntro(showIntro);
  // final showIntro = await UserSettings.shouldShowIntro();
  final walletPasswordSetted = await UserSettings.isPasswordSetted();
  return AppState(
      showIntro: showIntro,
      isWalletPasswordSetted: walletPasswordSetted,
      currentWallet: currentWallet);
});
