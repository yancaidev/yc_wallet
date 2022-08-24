// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class WalletInfo extends DataClass implements Insertable<WalletInfo> {
  final int id;
  final String address;
  final String? name;
  final bool? isMnemonicBackuped;
  final bool isCurrent;
  WalletInfo(
      {required this.id,
      required this.address,
      this.name,
      this.isMnemonicBackuped,
      required this.isCurrent});
  factory WalletInfo.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return WalletInfo(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      address: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}address'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      isMnemonicBackuped: const BoolType().mapFromDatabaseResponse(
          data['${effectivePrefix}is_mnemonic_backuped']),
      isCurrent: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_current'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['address'] = Variable<String>(address);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || isMnemonicBackuped != null) {
      map['is_mnemonic_backuped'] = Variable<bool?>(isMnemonicBackuped);
    }
    map['is_current'] = Variable<bool>(isCurrent);
    return map;
  }

  WalletInfoEntriesCompanion toCompanion(bool nullToAbsent) {
    return WalletInfoEntriesCompanion(
      id: Value(id),
      address: Value(address),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      isMnemonicBackuped: isMnemonicBackuped == null && nullToAbsent
          ? const Value.absent()
          : Value(isMnemonicBackuped),
      isCurrent: Value(isCurrent),
    );
  }

  factory WalletInfo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WalletInfo(
      id: serializer.fromJson<int>(json['id']),
      address: serializer.fromJson<String>(json['address']),
      name: serializer.fromJson<String?>(json['name']),
      isMnemonicBackuped:
          serializer.fromJson<bool?>(json['isMnemonicBackuped']),
      isCurrent: serializer.fromJson<bool>(json['isCurrent']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'address': serializer.toJson<String>(address),
      'name': serializer.toJson<String?>(name),
      'isMnemonicBackuped': serializer.toJson<bool?>(isMnemonicBackuped),
      'isCurrent': serializer.toJson<bool>(isCurrent),
    };
  }

  WalletInfo copyWith(
          {int? id,
          String? address,
          String? name,
          bool? isMnemonicBackuped,
          bool? isCurrent}) =>
      WalletInfo(
        id: id ?? this.id,
        address: address ?? this.address,
        name: name ?? this.name,
        isMnemonicBackuped: isMnemonicBackuped ?? this.isMnemonicBackuped,
        isCurrent: isCurrent ?? this.isCurrent,
      );
  @override
  String toString() {
    return (StringBuffer('WalletInfo(')
          ..write('id: $id, ')
          ..write('address: $address, ')
          ..write('name: $name, ')
          ..write('isMnemonicBackuped: $isMnemonicBackuped, ')
          ..write('isCurrent: $isCurrent')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, address, name, isMnemonicBackuped, isCurrent);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WalletInfo &&
          other.id == this.id &&
          other.address == this.address &&
          other.name == this.name &&
          other.isMnemonicBackuped == this.isMnemonicBackuped &&
          other.isCurrent == this.isCurrent);
}

class WalletInfoEntriesCompanion extends UpdateCompanion<WalletInfo> {
  final Value<int> id;
  final Value<String> address;
  final Value<String?> name;
  final Value<bool?> isMnemonicBackuped;
  final Value<bool> isCurrent;
  const WalletInfoEntriesCompanion({
    this.id = const Value.absent(),
    this.address = const Value.absent(),
    this.name = const Value.absent(),
    this.isMnemonicBackuped = const Value.absent(),
    this.isCurrent = const Value.absent(),
  });
  WalletInfoEntriesCompanion.insert({
    this.id = const Value.absent(),
    required String address,
    this.name = const Value.absent(),
    this.isMnemonicBackuped = const Value.absent(),
    this.isCurrent = const Value.absent(),
  }) : address = Value(address);
  static Insertable<WalletInfo> custom({
    Expression<int>? id,
    Expression<String>? address,
    Expression<String?>? name,
    Expression<bool?>? isMnemonicBackuped,
    Expression<bool>? isCurrent,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (address != null) 'address': address,
      if (name != null) 'name': name,
      if (isMnemonicBackuped != null)
        'is_mnemonic_backuped': isMnemonicBackuped,
      if (isCurrent != null) 'is_current': isCurrent,
    });
  }

  WalletInfoEntriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? address,
      Value<String?>? name,
      Value<bool?>? isMnemonicBackuped,
      Value<bool>? isCurrent}) {
    return WalletInfoEntriesCompanion(
      id: id ?? this.id,
      address: address ?? this.address,
      name: name ?? this.name,
      isMnemonicBackuped: isMnemonicBackuped ?? this.isMnemonicBackuped,
      isCurrent: isCurrent ?? this.isCurrent,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (isMnemonicBackuped.present) {
      map['is_mnemonic_backuped'] = Variable<bool?>(isMnemonicBackuped.value);
    }
    if (isCurrent.present) {
      map['is_current'] = Variable<bool>(isCurrent.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WalletInfoEntriesCompanion(')
          ..write('id: $id, ')
          ..write('address: $address, ')
          ..write('name: $name, ')
          ..write('isMnemonicBackuped: $isMnemonicBackuped, ')
          ..write('isCurrent: $isCurrent')
          ..write(')'))
        .toString();
  }
}

class $WalletInfoEntriesTable extends WalletInfoEntries
    with TableInfo<$WalletInfoEntriesTable, WalletInfo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WalletInfoEntriesTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _addressMeta = const VerificationMeta('address');
  @override
  late final GeneratedColumn<String?> address = GeneratedColumn<String?>(
      'address', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _isMnemonicBackupedMeta =
      const VerificationMeta('isMnemonicBackuped');
  @override
  late final GeneratedColumn<bool?> isMnemonicBackuped = GeneratedColumn<bool?>(
      'is_mnemonic_backuped', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_mnemonic_backuped IN (0, 1))');
  final VerificationMeta _isCurrentMeta = const VerificationMeta('isCurrent');
  @override
  late final GeneratedColumn<bool?> isCurrent = GeneratedColumn<bool?>(
      'is_current', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_current IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, address, name, isMnemonicBackuped, isCurrent];
  @override
  String get aliasedName => _alias ?? 'wallet_info_entries';
  @override
  String get actualTableName => 'wallet_info_entries';
  @override
  VerificationContext validateIntegrity(Insertable<WalletInfo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('is_mnemonic_backuped')) {
      context.handle(
          _isMnemonicBackupedMeta,
          isMnemonicBackuped.isAcceptableOrUnknown(
              data['is_mnemonic_backuped']!, _isMnemonicBackupedMeta));
    }
    if (data.containsKey('is_current')) {
      context.handle(_isCurrentMeta,
          isCurrent.isAcceptableOrUnknown(data['is_current']!, _isCurrentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WalletInfo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return WalletInfo.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $WalletInfoEntriesTable createAlias(String alias) {
    return $WalletInfoEntriesTable(attachedDatabase, alias);
  }
}

abstract class _$WalletDatabase extends GeneratedDatabase {
  _$WalletDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$WalletDatabase.connect(DatabaseConnection c) : super.connect(c);
  late final $WalletInfoEntriesTable walletInfoEntries =
      $WalletInfoEntriesTable(this);
  late final WalletInfoDao walletInfoDao =
      WalletInfoDao(this as WalletDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [walletInfoEntries];
}
