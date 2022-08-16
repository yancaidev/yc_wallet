// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'web3_chain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Web3Chain _$Web3ChainFromJson(Map<String, dynamic> json) {
  return _Web3Chain.fromJson(json);
}

/// @nodoc
mixin _$Web3Chain {
  ChainType get chainType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get symbol => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $Web3ChainCopyWith<Web3Chain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Web3ChainCopyWith<$Res> {
  factory $Web3ChainCopyWith(Web3Chain value, $Res Function(Web3Chain) then) =
      _$Web3ChainCopyWithImpl<$Res>;
  $Res call(
      {ChainType chainType,
      String name,
      String? symbol,
      String? logo,
      String? thumbnail});
}

/// @nodoc
class _$Web3ChainCopyWithImpl<$Res> implements $Web3ChainCopyWith<$Res> {
  _$Web3ChainCopyWithImpl(this._value, this._then);

  final Web3Chain _value;
  // ignore: unused_field
  final $Res Function(Web3Chain) _then;

  @override
  $Res call({
    Object? chainType = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
    Object? logo = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      chainType: chainType == freezed
          ? _value.chainType
          : chainType // ignore: cast_nullable_to_non_nullable
              as ChainType,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_Web3ChainCopyWith<$Res> implements $Web3ChainCopyWith<$Res> {
  factory _$$_Web3ChainCopyWith(
          _$_Web3Chain value, $Res Function(_$_Web3Chain) then) =
      __$$_Web3ChainCopyWithImpl<$Res>;
  @override
  $Res call(
      {ChainType chainType,
      String name,
      String? symbol,
      String? logo,
      String? thumbnail});
}

/// @nodoc
class __$$_Web3ChainCopyWithImpl<$Res> extends _$Web3ChainCopyWithImpl<$Res>
    implements _$$_Web3ChainCopyWith<$Res> {
  __$$_Web3ChainCopyWithImpl(
      _$_Web3Chain _value, $Res Function(_$_Web3Chain) _then)
      : super(_value, (v) => _then(v as _$_Web3Chain));

  @override
  _$_Web3Chain get _value => super._value as _$_Web3Chain;

  @override
  $Res call({
    Object? chainType = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
    Object? logo = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_$_Web3Chain(
      chainType: chainType == freezed
          ? _value.chainType
          : chainType // ignore: cast_nullable_to_non_nullable
              as ChainType,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_Web3Chain with DiagnosticableTreeMixin implements _Web3Chain {
  _$_Web3Chain(
      {required this.chainType,
      required this.name,
      this.symbol,
      this.logo,
      this.thumbnail});

  factory _$_Web3Chain.fromJson(Map<String, dynamic> json) =>
      _$$_Web3ChainFromJson(json);

  @override
  final ChainType chainType;
  @override
  final String name;
  @override
  final String? symbol;
  @override
  final String? logo;
  @override
  final String? thumbnail;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Web3Chain(chainType: $chainType, name: $name, symbol: $symbol, logo: $logo, thumbnail: $thumbnail)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Web3Chain'))
      ..add(DiagnosticsProperty('chainType', chainType))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('symbol', symbol))
      ..add(DiagnosticsProperty('logo', logo))
      ..add(DiagnosticsProperty('thumbnail', thumbnail));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Web3Chain &&
            const DeepCollectionEquality().equals(other.chainType, chainType) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.symbol, symbol) &&
            const DeepCollectionEquality().equals(other.logo, logo) &&
            const DeepCollectionEquality().equals(other.thumbnail, thumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(chainType),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(symbol),
      const DeepCollectionEquality().hash(logo),
      const DeepCollectionEquality().hash(thumbnail));

  @JsonKey(ignore: true)
  @override
  _$$_Web3ChainCopyWith<_$_Web3Chain> get copyWith =>
      __$$_Web3ChainCopyWithImpl<_$_Web3Chain>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_Web3ChainToJson(this);
  }
}

abstract class _Web3Chain implements Web3Chain {
  factory _Web3Chain(
      {required final ChainType chainType,
      required final String name,
      final String? symbol,
      final String? logo,
      final String? thumbnail}) = _$_Web3Chain;

  factory _Web3Chain.fromJson(Map<String, dynamic> json) =
      _$_Web3Chain.fromJson;

  @override
  ChainType get chainType;
  @override
  String get name;
  @override
  String? get symbol;
  @override
  String? get logo;
  @override
  String? get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$_Web3ChainCopyWith<_$_Web3Chain> get copyWith =>
      throw _privateConstructorUsedError;
}
