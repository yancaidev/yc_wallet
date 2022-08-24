import 'package:drift/drift.dart';

@DataClassName("WalletInfo")
class WalletInfoEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get address => text().unique().withLength()();
  TextColumn get name => text().unique().nullable()();
  BoolColumn get isMnemonicBackuped => boolean().nullable()();
  BoolColumn get isCurrent => boolean().withDefault(const Constant(false))();
}
