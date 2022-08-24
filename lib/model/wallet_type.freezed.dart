// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'wallet_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WalletType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String privateKey) privateKey,
    required TResult Function(List<String> words) mnemonic12,
    required TResult Function(List<String> words) mnemonic24,
    required TResult Function(Map<String, Object> json) json,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String privateKey)? privateKey,
    TResult Function(List<String> words)? mnemonic12,
    TResult Function(List<String> words)? mnemonic24,
    TResult Function(Map<String, Object> json)? json,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String privateKey)? privateKey,
    TResult Function(List<String> words)? mnemonic12,
    TResult Function(List<String> words)? mnemonic24,
    TResult Function(Map<String, Object> json)? json,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PrivateKey value) privateKey,
    required TResult Function(Mnemonic12 value) mnemonic12,
    required TResult Function(Mnemonic24 value) mnemonic24,
    required TResult Function(WalletJson value) json,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PrivateKey value)? privateKey,
    TResult Function(Mnemonic12 value)? mnemonic12,
    TResult Function(Mnemonic24 value)? mnemonic24,
    TResult Function(WalletJson value)? json,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PrivateKey value)? privateKey,
    TResult Function(Mnemonic12 value)? mnemonic12,
    TResult Function(Mnemonic24 value)? mnemonic24,
    TResult Function(WalletJson value)? json,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletTypeCopyWith<$Res> {
  factory $WalletTypeCopyWith(
          WalletType value, $Res Function(WalletType) then) =
      _$WalletTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$WalletTypeCopyWithImpl<$Res> implements $WalletTypeCopyWith<$Res> {
  _$WalletTypeCopyWithImpl(this._value, this._then);

  final WalletType _value;
  // ignore: unused_field
  final $Res Function(WalletType) _then;
}

/// @nodoc
abstract class _$$PrivateKeyCopyWith<$Res> {
  factory _$$PrivateKeyCopyWith(
          _$PrivateKey value, $Res Function(_$PrivateKey) then) =
      __$$PrivateKeyCopyWithImpl<$Res>;
  $Res call({String privateKey});
}

/// @nodoc
class __$$PrivateKeyCopyWithImpl<$Res> extends _$WalletTypeCopyWithImpl<$Res>
    implements _$$PrivateKeyCopyWith<$Res> {
  __$$PrivateKeyCopyWithImpl(
      _$PrivateKey _value, $Res Function(_$PrivateKey) _then)
      : super(_value, (v) => _then(v as _$PrivateKey));

  @override
  _$PrivateKey get _value => super._value as _$PrivateKey;

  @override
  $Res call({
    Object? privateKey = freezed,
  }) {
    return _then(_$PrivateKey(
      privateKey: privateKey == freezed
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PrivateKey implements PrivateKey {
  const _$PrivateKey({required this.privateKey});

  @override
  final String privateKey;

  @override
  String toString() {
    return 'WalletType.privateKey(privateKey: $privateKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivateKey &&
            const DeepCollectionEquality()
                .equals(other.privateKey, privateKey));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(privateKey));

  @JsonKey(ignore: true)
  @override
  _$$PrivateKeyCopyWith<_$PrivateKey> get copyWith =>
      __$$PrivateKeyCopyWithImpl<_$PrivateKey>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String privateKey) privateKey,
    required TResult Function(List<String> words) mnemonic12,
    required TResult Function(List<String> words) mnemonic24,
    required TResult Function(Map<String, Object> json) json,
  }) {
    return privateKey(this.privateKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String privateKey)? privateKey,
    TResult Function(List<String> words)? mnemonic12,
    TResult Function(List<String> words)? mnemonic24,
    TResult Function(Map<String, Object> json)? json,
  }) {
    return privateKey?.call(this.privateKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String privateKey)? privateKey,
    TResult Function(List<String> words)? mnemonic12,
    TResult Function(List<String> words)? mnemonic24,
    TResult Function(Map<String, Object> json)? json,
    required TResult orElse(),
  }) {
    if (privateKey != null) {
      return privateKey(this.privateKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PrivateKey value) privateKey,
    required TResult Function(Mnemonic12 value) mnemonic12,
    required TResult Function(Mnemonic24 value) mnemonic24,
    required TResult Function(WalletJson value) json,
  }) {
    return privateKey(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PrivateKey value)? privateKey,
    TResult Function(Mnemonic12 value)? mnemonic12,
    TResult Function(Mnemonic24 value)? mnemonic24,
    TResult Function(WalletJson value)? json,
  }) {
    return privateKey?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PrivateKey value)? privateKey,
    TResult Function(Mnemonic12 value)? mnemonic12,
    TResult Function(Mnemonic24 value)? mnemonic24,
    TResult Function(WalletJson value)? json,
    required TResult orElse(),
  }) {
    if (privateKey != null) {
      return privateKey(this);
    }
    return orElse();
  }
}

abstract class PrivateKey implements WalletType {
  const factory PrivateKey({required final String privateKey}) = _$PrivateKey;

  String get privateKey;
  @JsonKey(ignore: true)
  _$$PrivateKeyCopyWith<_$PrivateKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Mnemonic12CopyWith<$Res> {
  factory _$$Mnemonic12CopyWith(
          _$Mnemonic12 value, $Res Function(_$Mnemonic12) then) =
      __$$Mnemonic12CopyWithImpl<$Res>;
  $Res call({List<String> words});
}

/// @nodoc
class __$$Mnemonic12CopyWithImpl<$Res> extends _$WalletTypeCopyWithImpl<$Res>
    implements _$$Mnemonic12CopyWith<$Res> {
  __$$Mnemonic12CopyWithImpl(
      _$Mnemonic12 _value, $Res Function(_$Mnemonic12) _then)
      : super(_value, (v) => _then(v as _$Mnemonic12));

  @override
  _$Mnemonic12 get _value => super._value as _$Mnemonic12;

  @override
  $Res call({
    Object? words = freezed,
  }) {
    return _then(_$Mnemonic12(
      words: words == freezed
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$Mnemonic12 implements Mnemonic12 {
  const _$Mnemonic12({required final List<String> words}) : _words = words;

  final List<String> _words;
  @override
  List<String> get words {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  String toString() {
    return 'WalletType.mnemonic12(words: $words)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Mnemonic12 &&
            const DeepCollectionEquality().equals(other._words, _words));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_words));

  @JsonKey(ignore: true)
  @override
  _$$Mnemonic12CopyWith<_$Mnemonic12> get copyWith =>
      __$$Mnemonic12CopyWithImpl<_$Mnemonic12>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String privateKey) privateKey,
    required TResult Function(List<String> words) mnemonic12,
    required TResult Function(List<String> words) mnemonic24,
    required TResult Function(Map<String, Object> json) json,
  }) {
    return mnemonic12(words);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String privateKey)? privateKey,
    TResult Function(List<String> words)? mnemonic12,
    TResult Function(List<String> words)? mnemonic24,
    TResult Function(Map<String, Object> json)? json,
  }) {
    return mnemonic12?.call(words);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String privateKey)? privateKey,
    TResult Function(List<String> words)? mnemonic12,
    TResult Function(List<String> words)? mnemonic24,
    TResult Function(Map<String, Object> json)? json,
    required TResult orElse(),
  }) {
    if (mnemonic12 != null) {
      return mnemonic12(words);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PrivateKey value) privateKey,
    required TResult Function(Mnemonic12 value) mnemonic12,
    required TResult Function(Mnemonic24 value) mnemonic24,
    required TResult Function(WalletJson value) json,
  }) {
    return mnemonic12(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PrivateKey value)? privateKey,
    TResult Function(Mnemonic12 value)? mnemonic12,
    TResult Function(Mnemonic24 value)? mnemonic24,
    TResult Function(WalletJson value)? json,
  }) {
    return mnemonic12?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PrivateKey value)? privateKey,
    TResult Function(Mnemonic12 value)? mnemonic12,
    TResult Function(Mnemonic24 value)? mnemonic24,
    TResult Function(WalletJson value)? json,
    required TResult orElse(),
  }) {
    if (mnemonic12 != null) {
      return mnemonic12(this);
    }
    return orElse();
  }
}

abstract class Mnemonic12 implements WalletType {
  const factory Mnemonic12({required final List<String> words}) = _$Mnemonic12;

  List<String> get words;
  @JsonKey(ignore: true)
  _$$Mnemonic12CopyWith<_$Mnemonic12> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$Mnemonic24CopyWith<$Res> {
  factory _$$Mnemonic24CopyWith(
          _$Mnemonic24 value, $Res Function(_$Mnemonic24) then) =
      __$$Mnemonic24CopyWithImpl<$Res>;
  $Res call({List<String> words});
}

/// @nodoc
class __$$Mnemonic24CopyWithImpl<$Res> extends _$WalletTypeCopyWithImpl<$Res>
    implements _$$Mnemonic24CopyWith<$Res> {
  __$$Mnemonic24CopyWithImpl(
      _$Mnemonic24 _value, $Res Function(_$Mnemonic24) _then)
      : super(_value, (v) => _then(v as _$Mnemonic24));

  @override
  _$Mnemonic24 get _value => super._value as _$Mnemonic24;

  @override
  $Res call({
    Object? words = freezed,
  }) {
    return _then(_$Mnemonic24(
      words: words == freezed
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$Mnemonic24 implements Mnemonic24 {
  const _$Mnemonic24({required final List<String> words}) : _words = words;

  final List<String> _words;
  @override
  List<String> get words {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

  @override
  String toString() {
    return 'WalletType.mnemonic24(words: $words)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Mnemonic24 &&
            const DeepCollectionEquality().equals(other._words, _words));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_words));

  @JsonKey(ignore: true)
  @override
  _$$Mnemonic24CopyWith<_$Mnemonic24> get copyWith =>
      __$$Mnemonic24CopyWithImpl<_$Mnemonic24>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String privateKey) privateKey,
    required TResult Function(List<String> words) mnemonic12,
    required TResult Function(List<String> words) mnemonic24,
    required TResult Function(Map<String, Object> json) json,
  }) {
    return mnemonic24(words);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String privateKey)? privateKey,
    TResult Function(List<String> words)? mnemonic12,
    TResult Function(List<String> words)? mnemonic24,
    TResult Function(Map<String, Object> json)? json,
  }) {
    return mnemonic24?.call(words);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String privateKey)? privateKey,
    TResult Function(List<String> words)? mnemonic12,
    TResult Function(List<String> words)? mnemonic24,
    TResult Function(Map<String, Object> json)? json,
    required TResult orElse(),
  }) {
    if (mnemonic24 != null) {
      return mnemonic24(words);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PrivateKey value) privateKey,
    required TResult Function(Mnemonic12 value) mnemonic12,
    required TResult Function(Mnemonic24 value) mnemonic24,
    required TResult Function(WalletJson value) json,
  }) {
    return mnemonic24(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PrivateKey value)? privateKey,
    TResult Function(Mnemonic12 value)? mnemonic12,
    TResult Function(Mnemonic24 value)? mnemonic24,
    TResult Function(WalletJson value)? json,
  }) {
    return mnemonic24?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PrivateKey value)? privateKey,
    TResult Function(Mnemonic12 value)? mnemonic12,
    TResult Function(Mnemonic24 value)? mnemonic24,
    TResult Function(WalletJson value)? json,
    required TResult orElse(),
  }) {
    if (mnemonic24 != null) {
      return mnemonic24(this);
    }
    return orElse();
  }
}

abstract class Mnemonic24 implements WalletType {
  const factory Mnemonic24({required final List<String> words}) = _$Mnemonic24;

  List<String> get words;
  @JsonKey(ignore: true)
  _$$Mnemonic24CopyWith<_$Mnemonic24> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WalletJsonCopyWith<$Res> {
  factory _$$WalletJsonCopyWith(
          _$WalletJson value, $Res Function(_$WalletJson) then) =
      __$$WalletJsonCopyWithImpl<$Res>;
  $Res call({Map<String, Object> json});
}

/// @nodoc
class __$$WalletJsonCopyWithImpl<$Res> extends _$WalletTypeCopyWithImpl<$Res>
    implements _$$WalletJsonCopyWith<$Res> {
  __$$WalletJsonCopyWithImpl(
      _$WalletJson _value, $Res Function(_$WalletJson) _then)
      : super(_value, (v) => _then(v as _$WalletJson));

  @override
  _$WalletJson get _value => super._value as _$WalletJson;

  @override
  $Res call({
    Object? json = freezed,
  }) {
    return _then(_$WalletJson(
      json: json == freezed
          ? _value._json
          : json // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>,
    ));
  }
}

/// @nodoc

class _$WalletJson implements WalletJson {
  const _$WalletJson({required final Map<String, Object> json}) : _json = json;

  final Map<String, Object> _json;
  @override
  Map<String, Object> get json {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_json);
  }

  @override
  String toString() {
    return 'WalletType.json(json: $json)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletJson &&
            const DeepCollectionEquality().equals(other._json, _json));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_json));

  @JsonKey(ignore: true)
  @override
  _$$WalletJsonCopyWith<_$WalletJson> get copyWith =>
      __$$WalletJsonCopyWithImpl<_$WalletJson>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String privateKey) privateKey,
    required TResult Function(List<String> words) mnemonic12,
    required TResult Function(List<String> words) mnemonic24,
    required TResult Function(Map<String, Object> json) json,
  }) {
    return json(this.json);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String privateKey)? privateKey,
    TResult Function(List<String> words)? mnemonic12,
    TResult Function(List<String> words)? mnemonic24,
    TResult Function(Map<String, Object> json)? json,
  }) {
    return json?.call(this.json);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String privateKey)? privateKey,
    TResult Function(List<String> words)? mnemonic12,
    TResult Function(List<String> words)? mnemonic24,
    TResult Function(Map<String, Object> json)? json,
    required TResult orElse(),
  }) {
    if (json != null) {
      return json(this.json);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PrivateKey value) privateKey,
    required TResult Function(Mnemonic12 value) mnemonic12,
    required TResult Function(Mnemonic24 value) mnemonic24,
    required TResult Function(WalletJson value) json,
  }) {
    return json(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PrivateKey value)? privateKey,
    TResult Function(Mnemonic12 value)? mnemonic12,
    TResult Function(Mnemonic24 value)? mnemonic24,
    TResult Function(WalletJson value)? json,
  }) {
    return json?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PrivateKey value)? privateKey,
    TResult Function(Mnemonic12 value)? mnemonic12,
    TResult Function(Mnemonic24 value)? mnemonic24,
    TResult Function(WalletJson value)? json,
    required TResult orElse(),
  }) {
    if (json != null) {
      return json(this);
    }
    return orElse();
  }
}

abstract class WalletJson implements WalletType {
  const factory WalletJson({required final Map<String, Object> json}) =
      _$WalletJson;

  Map<String, Object> get json;
  @JsonKey(ignore: true)
  _$$WalletJsonCopyWith<_$WalletJson> get copyWith =>
      throw _privateConstructorUsedError;
}
