// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'erc20.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Erc20 _$Erc20FromJson(Map<String, dynamic> json) {
  return _Erc20.fromJson(json);
}

/// @nodoc
mixin _$Erc20 {
  @JsonKey(name: 'token_address')
  String? get tokenAddress => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get symbol => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;
  int? get decimals => throw _privateConstructorUsedError;
  String? get balance => throw _privateConstructorUsedError;
  Web3Chain? get chain => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Erc20CopyWith<Erc20> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Erc20CopyWith<$Res> {
  factory $Erc20CopyWith(Erc20 value, $Res Function(Erc20) then) =
      _$Erc20CopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'token_address') String? tokenAddress,
      String? name,
      String? symbol,
      String? logo,
      String? thumbnail,
      int? decimals,
      String? balance,
      Web3Chain? chain});

  $Web3ChainCopyWith<$Res>? get chain;
}

/// @nodoc
class _$Erc20CopyWithImpl<$Res> implements $Erc20CopyWith<$Res> {
  _$Erc20CopyWithImpl(this._value, this._then);

  final Erc20 _value;
  // ignore: unused_field
  final $Res Function(Erc20) _then;

  @override
  $Res call({
    Object? tokenAddress = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
    Object? logo = freezed,
    Object? thumbnail = freezed,
    Object? decimals = freezed,
    Object? balance = freezed,
    Object? chain = freezed,
  }) {
    return _then(_value.copyWith(
      tokenAddress: tokenAddress == freezed
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      decimals: decimals == freezed
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int?,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String?,
      chain: chain == freezed
          ? _value.chain
          : chain // ignore: cast_nullable_to_non_nullable
              as Web3Chain?,
    ));
  }

  @override
  $Web3ChainCopyWith<$Res>? get chain {
    if (_value.chain == null) {
      return null;
    }

    return $Web3ChainCopyWith<$Res>(_value.chain!, (value) {
      return _then(_value.copyWith(chain: value));
    });
  }
}

/// @nodoc
abstract class _$$_Erc20CopyWith<$Res> implements $Erc20CopyWith<$Res> {
  factory _$$_Erc20CopyWith(_$_Erc20 value, $Res Function(_$_Erc20) then) =
      __$$_Erc20CopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'token_address') String? tokenAddress,
      String? name,
      String? symbol,
      String? logo,
      String? thumbnail,
      int? decimals,
      String? balance,
      Web3Chain? chain});

  @override
  $Web3ChainCopyWith<$Res>? get chain;
}

/// @nodoc
class __$$_Erc20CopyWithImpl<$Res> extends _$Erc20CopyWithImpl<$Res>
    implements _$$_Erc20CopyWith<$Res> {
  __$$_Erc20CopyWithImpl(_$_Erc20 _value, $Res Function(_$_Erc20) _then)
      : super(_value, (v) => _then(v as _$_Erc20));

  @override
  _$_Erc20 get _value => super._value as _$_Erc20;

  @override
  $Res call({
    Object? tokenAddress = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
    Object? logo = freezed,
    Object? thumbnail = freezed,
    Object? decimals = freezed,
    Object? balance = freezed,
    Object? chain = freezed,
  }) {
    return _then(_$_Erc20(
      tokenAddress: tokenAddress == freezed
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: symbol == freezed
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: thumbnail == freezed
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
      decimals: decimals == freezed
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int?,
      balance: balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String?,
      chain: chain == freezed
          ? _value.chain
          : chain // ignore: cast_nullable_to_non_nullable
              as Web3Chain?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Erc20 implements _Erc20 {
  _$_Erc20(
      {@JsonKey(name: 'token_address') this.tokenAddress,
      this.name,
      this.symbol,
      this.logo,
      this.thumbnail,
      this.decimals,
      this.balance,
      this.chain});

  factory _$_Erc20.fromJson(Map<String, dynamic> json) =>
      _$$_Erc20FromJson(json);

  @override
  @JsonKey(name: 'token_address')
  final String? tokenAddress;
  @override
  final String? name;
  @override
  final String? symbol;
  @override
  final String? logo;
  @override
  final String? thumbnail;
  @override
  final int? decimals;
  @override
  final String? balance;
  @override
  final Web3Chain? chain;

  @override
  String toString() {
    return 'Erc20(tokenAddress: $tokenAddress, name: $name, symbol: $symbol, logo: $logo, thumbnail: $thumbnail, decimals: $decimals, balance: $balance, chain: $chain)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Erc20 &&
            const DeepCollectionEquality()
                .equals(other.tokenAddress, tokenAddress) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality().equals(other.logo, logo) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail) &&
            const DeepCollectionEquality().equals(other.decimals, decimals) &&
            const DeepCollectionEquality().equals(other.balance, balance) &&
            const DeepCollectionEquality().equals(other.chain, chain));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(tokenAddress),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(logo),
      const DeepCollectionEquality().hash(thumbnail),
      const DeepCollectionEquality().hash(decimals),
      const DeepCollectionEquality().hash(balance),
      const DeepCollectionEquality().hash(chain));

  @JsonKey(ignore: true)
  @override
  _$$_Erc20CopyWith<_$_Erc20> get copyWith =>
      __$$_Erc20CopyWithImpl<_$_Erc20>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Erc20ToJson(this);
  }
}

abstract class _Erc20 implements Erc20 {
  factory _Erc20(
      {@JsonKey(name: 'token_address') final String? tokenAddress,
      final String? name,
      final String? symbol,
      final String? logo,
      final String? thumbnail,
      final int? decimals,
      final String? balance,
      final Web3Chain? chain}) = _$_Erc20;

  factory _Erc20.fromJson(Map<String, dynamic> json) = _$_Erc20.fromJson;

  @override
  @JsonKey(name: 'token_address')
  String? get tokenAddress;
  @override
  String? get name;
  @override
  String? get symbol;
  @override
  String? get logo;
  @override
  String? get thumbnail;
  @override
  int? get decimals;
  @override
  String? get balance;
  @override
  Web3Chain? get chain;
  @override
  @JsonKey(ignore: true)
  _$$_Erc20CopyWith<_$_Erc20> get copyWith =>
      throw _privateConstructorUsedError;
}
