// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chain_network.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChainNetwork {
  String get name => throw _privateConstructorUsedError;
  bool get isAll => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  set isSelected(bool value) => throw _privateConstructorUsedError;
  MoralisChain? get chain => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChainNetworkCopyWith<ChainNetwork> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChainNetworkCopyWith<$Res> {
  factory $ChainNetworkCopyWith(
          ChainNetwork value, $Res Function(ChainNetwork) then) =
      _$ChainNetworkCopyWithImpl<$Res>;
  $Res call({String name, bool isAll, bool isSelected, MoralisChain? chain});

  $MoralisChainCopyWith<$Res>? get chain;
}

/// @nodoc
class _$ChainNetworkCopyWithImpl<$Res> implements $ChainNetworkCopyWith<$Res> {
  _$ChainNetworkCopyWithImpl(this._value, this._then);

  final ChainNetwork _value;
  // ignore: unused_field
  final $Res Function(ChainNetwork) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? isAll = freezed,
    Object? isSelected = freezed,
    Object? chain = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isAll: isAll == freezed
          ? _value.isAll
          : isAll // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      chain: chain == freezed
          ? _value.chain
          : chain // ignore: cast_nullable_to_non_nullable
              as MoralisChain?,
    ));
  }

  @override
  $MoralisChainCopyWith<$Res>? get chain {
    if (_value.chain == null) {
      return null;
    }

    return $MoralisChainCopyWith<$Res>(_value.chain!, (value) {
      return _then(_value.copyWith(chain: value));
    });
  }
}

/// @nodoc
abstract class _$$_ChainNetworkCopyWith<$Res>
    implements $ChainNetworkCopyWith<$Res> {
  factory _$$_ChainNetworkCopyWith(
          _$_ChainNetwork value, $Res Function(_$_ChainNetwork) then) =
      __$$_ChainNetworkCopyWithImpl<$Res>;
  @override
  $Res call({String name, bool isAll, bool isSelected, MoralisChain? chain});

  @override
  $MoralisChainCopyWith<$Res>? get chain;
}

/// @nodoc
class __$$_ChainNetworkCopyWithImpl<$Res>
    extends _$ChainNetworkCopyWithImpl<$Res>
    implements _$$_ChainNetworkCopyWith<$Res> {
  __$$_ChainNetworkCopyWithImpl(
      _$_ChainNetwork _value, $Res Function(_$_ChainNetwork) _then)
      : super(_value, (v) => _then(v as _$_ChainNetwork));

  @override
  _$_ChainNetwork get _value => super._value as _$_ChainNetwork;

  @override
  $Res call({
    Object? name = freezed,
    Object? isAll = freezed,
    Object? isSelected = freezed,
    Object? chain = freezed,
  }) {
    return _then(_$_ChainNetwork(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isAll: isAll == freezed
          ? _value.isAll
          : isAll // ignore: cast_nullable_to_non_nullable
              as bool,
      isSelected: isSelected == freezed
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
      chain: chain == freezed
          ? _value.chain
          : chain // ignore: cast_nullable_to_non_nullable
              as MoralisChain?,
    ));
  }
}

/// @nodoc

class _$_ChainNetwork with DiagnosticableTreeMixin implements _ChainNetwork {
  _$_ChainNetwork(
      {required this.name,
      this.isAll = false,
      this.isSelected = false,
      this.chain});

  @override
  final String name;
  @override
  @JsonKey()
  final bool isAll;
  @override
  @JsonKey()
  bool isSelected;
  @override
  final MoralisChain? chain;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChainNetwork(name: $name, isAll: $isAll, isSelected: $isSelected, chain: $chain)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChainNetwork'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('isAll', isAll))
      ..add(DiagnosticsProperty('isSelected', isSelected))
      ..add(DiagnosticsProperty('chain', chain));
  }

  @JsonKey(ignore: true)
  @override
  _$$_ChainNetworkCopyWith<_$_ChainNetwork> get copyWith =>
      __$$_ChainNetworkCopyWithImpl<_$_ChainNetwork>(this, _$identity);
}

abstract class _ChainNetwork implements ChainNetwork {
  factory _ChainNetwork(
      {required final String name,
      final bool isAll,
      bool isSelected,
      final MoralisChain? chain}) = _$_ChainNetwork;

  @override
  String get name;
  @override
  bool get isAll;
  @override
  bool get isSelected;
  set isSelected(bool value);
  @override
  MoralisChain? get chain;
  @override
  @JsonKey(ignore: true)
  _$$_ChainNetworkCopyWith<_$_ChainNetwork> get copyWith =>
      throw _privateConstructorUsedError;
}
