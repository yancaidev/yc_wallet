import 'package:drift/drift.dart';
import 'package:yc_wallet/model/do/wallet_info_entries.dart';
import 'package:yc_wallet/repository/database/wallet_database.dart';

part 'wallet_info_dao.g.dart';

@DriftAccessor(tables: [WalletInfoEntries])
class WalletInfoDao extends DatabaseAccessor<WalletDatabase>
    with _$WalletInfoDaoMixin {
  WalletInfoDao(WalletDatabase database) : super(database);

  /// 查找所有的钱包
  Future<List<WalletInfo>> get allWallets => (select(walletInfoEntries)
        ..orderBy([(wi) => OrderingTerm.asc(wi.address)]))
      .get();

  Future<WalletInfo?> findWalletByAddress(String address) {
    return (select(walletInfoEntries)
          ..where((tbl) => tbl.address.equals(address)))
        .getSingleOrNull();
  }

  /// 查找当前钱包
  Future<WalletInfo?> findCurrentWallet() {
    return (select(walletInfoEntries)
          ..where((tbl) => tbl.isCurrent.equals(true)))
        .getSingleOrNull();
  }

  /// 监听当前钱包变化
  Stream<WalletInfo?> watchCurrentWallet() {
    return (select(walletInfoEntries)
          ..where((tbl) => tbl.isCurrent.equals(true)))
        .watchSingleOrNull();
  }

  /// 添加钱包
  Future<int> addWallet(WalletInfoEntriesCompanion walletInfoData) {
    return into(walletInfoEntries).insert(walletInfoData);
  }

  /// 删除钱包
  Future<int> deleteWalletByAddress(String address) {
    return (delete(walletInfoEntries)
          ..where((tbl) => tbl.address.equals(address)))
        .go();
  }

  /// 设置当前钱包
  Future<bool> setCurrentWalletByAddress(String address) async {
    final currentWallet = await findCurrentWallet();
    if (currentWallet?.address == address) return true;
    await (update(walletInfoEntries)
          ..where((tbl) => tbl.isCurrent.equals(true)))
        .write(const WalletInfoEntriesCompanion(isCurrent: Value(false)));
    await (update(walletInfoEntries)
          ..where((tbl) => tbl.address.equals(address)))
        .write(const WalletInfoEntriesCompanion(isCurrent: Value(true)));
    return true;
  }

  /// 监测钱包变化
  Stream<List<WalletInfo>> watchMyWallets() {
    return select(walletInfoEntries).watch();
  }
}
