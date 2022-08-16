import 'dart:io';

import 'package:drift/drift.dart';
import 'package:yc_wallet/model/dao/wallet_info_dao.dart';
import 'package:yc_wallet/model/do/wallet_info_entries.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'wallet_database.g.dart';

@DriftDatabase(tables: [WalletInfoEntries], daos: [WalletInfoDao])
class WalletDatabase extends _$WalletDatabase {
  WalletDatabase() : super(_openConnection());

  WalletDatabase.connect(DatabaseConnection connection)
      : super.connect(connection);

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'yc-wallet-db.sqlite'));
    return NativeDatabase(file);
  });
}
