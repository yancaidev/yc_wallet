// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'moralis_chain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoralisChain _$MoralisChainFromJson(Map<String, dynamic> json) {
  return _MoralisChain.fromJson(json);
}

/// @nodoc
mixin _$MoralisChain {
  String get name => throw _privateConstructorUsedError;
  int get decimals => throw _privateConstructorUsedError;
  String get marketCapPlatformName => throw _privateConstructorUsedError;
  String? get tokenName => throw _privateConstructorUsedError;
  String? get symbol => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoralisChainCopyWith<MoralisChain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoralisChainCopyWith<$Res> {
  factory $MoralisChainCopyWith(
          MoralisChain value, $Res Function(MoralisChain) then) =
      _$MoralisChainCopyWithImpl<$Res>;
  $Res call(
      {String name,
      int decimals,
      String marketCapPlatformName,
      String? tokenName,
      String? symbol,
      String? logo,
      String? thumbnail});
}

/// @nodoc
class _$MoralisChainCopyWithImpl<$Res> implements $MoralisChainCopyWith<$Res> {
  _$MoralisChainCopyWithImpl(this._value, this._then);

  final MoralisChain _value;
  // ignore: unused_field
  final $Res Function(MoralisChain) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? decimals = freezed,
    Object? marketCapPlatformName = freezed,
    Object? tokenName = freezed,
    Object? symbol = freezed,
    Object? logo = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      decimals: decimals == freezed
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      marketCapPlatformName: marketCapPlatformName == freezed
          ? _value.marketCapPlatformName
          : marketCapPlatformName // ignore: cast_nullable_to_non_nullable
              as String,
      tokenName: tokenName == freezed
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
abstract class _$$_MoralisChainCopyWith<$Res>
    implements $MoralisChainCopyWith<$Res> {
  factory _$$_MoralisChainCopyWith(
          _$_MoralisChain value, $Res Function(_$_MoralisChain) then) =
      __$$_MoralisChainCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      int decimals,
      String marketCapPlatformName,
      String? tokenName,
      String? symbol,
      String? logo,
      String? thumbnail});
}

/// @nodoc
class __$$_MoralisChainCopyWithImpl<$Res>
    extends _$MoralisChainCopyWithImpl<$Res>
    implements _$$_MoralisChainCopyWith<$Res> {
  __$$_MoralisChainCopyWithImpl(
      _$_MoralisChain _value, $Res Function(_$_MoralisChain) _then)
      : super(_value, (v) => _then(v as _$_MoralisChain));

  @override
  _$_MoralisChain get _value => super._value as _$_MoralisChain;

  @override
  $Res call({
    Object? name = freezed,
    Object? decimals = freezed,
    Object? marketCapPlatformName = freezed,
    Object? tokenName = freezed,
    Object? symbol = freezed,
    Object? logo = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_$_MoralisChain(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      decimals: decimals == freezed
          ? _value.decimals
          : decimals // ignore: cast_nullable_to_non_nullable
              as int,
      marketCapPlatformName: marketCapPlatformName == freezed
          ? _value.marketCapPlatformName
          : marketCapPlatformName // ignore: cast_nullable_to_non_nullable
              as String,
      tokenName: tokenName == freezed
          ? _value.tokenName
          : tokenName // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MoralisChain with DiagnosticableTreeMixin implements _MoralisChain {
  _$_MoralisChain(
      {required this.name,
      required this.decimals,
      required this.marketCapPlatformName,
      this.tokenName,
      this.symbol,
      this.logo,
      this.thumbnail});

  factory _$_MoralisChain.fromJson(Map<String, dynamic> json) =>
      _$$_MoralisChainFromJson(json);

  @override
  final String name;
  @override
  final int decimals;
  @override
  final String marketCapPlatformName;
  @override
  final String? tokenName;
  @override
  final String? symbol;
  @override
  final String? logo;
  @override
  final String? thumbnail;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MoralisChain(name: $name, decimals: $decimals, marketCapPlatformName: $marketCapPlatformName, tokenName: $tokenName, symbol: $symbol, logo: $logo, thumbnail: $thumbnail)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MoralisChain'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('decimals', decimals))
      ..add(DiagnosticsProperty('marketCapPlatformName', marketCapPlatformName))
      ..add(DiagnosticsProperty('tokenName', tokenName))
      ..add(DiagnosticsProperty('symbol', symbol))
      ..add(DiagnosticsProperty('logo', logo))
      ..add(DiagnosticsProperty('thumbnail', thumbnail));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoralisChain &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.decimals, decimals) &&
            const DeepCollectionEquality()
                .equals(other.marketCapPlatformName, marketCapPlatformName) &&
            const DeepCollectionEquality().equals(other.tokenName, tokenName) &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality().equals(other.logo, logo) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(decimals),
      const DeepCollectionEquality().hash(marketCapPlatformName),
      const DeepCollectionEquality().hash(tokenName),
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(logo),
      const DeepCollectionEquality().hash(thumbnail));

  @JsonKey(ignore: true)
  @override
  _$$_MoralisChainCopyWith<_$_MoralisChain> get copyWith =>
      __$$_MoralisChainCopyWithImpl<_$_MoralisChain>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MoralisChainToJson(this);
  }
}

abstract class _MoralisChain implements MoralisChain {
  factory _MoralisChain(
      {required final String name,
      required final int decimals,
      required final String marketCapPlatformName,
      final String? tokenName,
      final String? symbol,
      final String? logo,
      final String? thumbnail}) = _$_MoralisChain;

  factory _MoralisChain.fromJson(Map<String, dynamic> json) =
      _$_MoralisChain.fromJson;

  @override
  String get name;
  @override
  int get decimals;
  @override
  String get marketCapPlatformName;
  @override
  String? get tokenName;
  @override
  String? get symbol;
  @override
  String? get logo;
  @override
  String? get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$_MoralisChainCopyWith<_$_MoralisChain> get copyWith =>
      throw _privateConstructorUsedError;
}
