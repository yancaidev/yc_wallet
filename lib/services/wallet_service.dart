import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web3dart/web3dart.dart';
import 'package:yc_wallet/features/wallet/wallet_manager.dart';
import 'package:yc_wallet/model/wallet_type.dart';
import 'package:yc_wallet/repository/apis/moralis/models/erc20/erc20.dart';
import 'package:yc_wallet/repository/apis/moralis/models/web3_chain.dart';
import 'package:yc_wallet/repository/apis/moralis/moralis_api.dart';
import 'package:yc_wallet/repository/database/wallet_database.dart';
import 'package:yc_wallet/share/providers.dart';
import 'package:yc_wallet/share/quick_import.dart';

/// 将钱包保存到数据库
Future saveWalletFromWalletType(
  WidgetRef ref,
  WalletType walletType,
  String password,
  bool isBackup,
) async {
  final wallet = WalletManager.fromWalletType(
    walletType: walletType,
    password: password,
  );

  await saveWallet(ref, wallet, password, isBackup);
}

/// 将钱包保存到数据库
Future saveWallet(
  WidgetRef ref,
  Wallet wallet,
  String password,
  bool isBackup,
) async {
  final address = wallet.privateKey.address.hex;
  final info =
      await ref.read(walletInfoDaoProvider).findWalletByAddress(address);
  if (info != null) {
    Log.i("钱包已存在");
    return;
  }
  await WalletManager.shared.addWallet(wallet);
  final infoCompanion = WalletInfoEntriesCompanion.insert(
    address: address,
    isCurrent: const Value(true),
    isMnemonicBackuped: Value(isBackup),
  );
  await ref.read(walletInfoDaoProvider).setCurrentWalletByAddress(address);
  await ref.read(walletInfoDaoProvider).addWallet(infoCompanion);
}

/// 获取某地址在某链上的所有资产
Future<List<Erc20>> getBalances(String address, Web3Chain chain) async {
  final nativeBalance =
      await MoralisApi.client.getNativeBalance(address, chain.name);
  final tokenBalances =
      await MoralisApi.client.getTokenBalances(address, chain.name);

  final native = nativeBalance.copyWith(
      chain: chain,
      name: chain.name,
      symbol: chain.symbol,
      logo: chain.logo,
      thumbnail: chain.thumbnail);

  /// 注入链信息
  tokenBalances.map((e) => e.copyWith(chain: chain));
  tokenBalances.insert(0, native);
  return tokenBalances;
}
