// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ListResult<T> {
  List<T>? get data => throw _privateConstructorUsedError;
  ResultStatus? get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ListResultCopyWith<T, ListResult<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListResultCopyWith<T, $Res> {
  factory $ListResultCopyWith(
          ListResult<T> value, $Res Function(ListResult<T>) then) =
      _$ListResultCopyWithImpl<T, $Res>;
  $Res call({List<T>? data, ResultStatus? status});

  $ResultStatusCopyWith<$Res>? get status;
}

/// @nodoc
class _$ListResultCopyWithImpl<T, $Res>
    implements $ListResultCopyWith<T, $Res> {
  _$ListResultCopyWithImpl(this._value, this._then);

  final ListResult<T> _value;
  // ignore: unused_field
  final $Res Function(ListResult<T>) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ResultStatus?,
    ));
  }

  @override
  $ResultStatusCopyWith<$Res>? get status {
    if (_value.status == null) {
      return null;
    }

    return $ResultStatusCopyWith<$Res>(_value.status!, (value) {
      return _then(_value.copyWith(status: value));
    });
  }
}

/// @nodoc
abstract class _$$_ListResultCopyWith<T, $Res>
    implements $ListResultCopyWith<T, $Res> {
  factory _$$_ListResultCopyWith(
          _$_ListResult<T> value, $Res Function(_$_ListResult<T>) then) =
      __$$_ListResultCopyWithImpl<T, $Res>;
  @override
  $Res call({List<T>? data, ResultStatus? status});

  @override
  $ResultStatusCopyWith<$Res>? get status;
}

/// @nodoc
class __$$_ListResultCopyWithImpl<T, $Res>
    extends _$ListResultCopyWithImpl<T, $Res>
    implements _$$_ListResultCopyWith<T, $Res> {
  __$$_ListResultCopyWithImpl(
      _$_ListResult<T> _value, $Res Function(_$_ListResult<T>) _then)
      : super(_value, (v) => _then(v as _$_ListResult<T>));

  @override
  _$_ListResult<T> get _value => super._value as _$_ListResult<T>;

  @override
  $Res call({
    Object? data = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_ListResult<T>(
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ResultStatus?,
    ));
  }
}

/// @nodoc

class _$_ListResult<T> implements _ListResult<T> {
  _$_ListResult({final List<T>? data, this.status}) : _data = data;

  final List<T>? _data;
  @override
  List<T>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ResultStatus? status;

  @override
  String toString() {
    return 'ListResult<$T>(data: $data, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListResult<T> &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_ListResultCopyWith<T, _$_ListResult<T>> get copyWith =>
      __$$_ListResultCopyWithImpl<T, _$_ListResult<T>>(this, _$identity);
}

abstract class _ListResult<T> implements ListResult<T> {
  factory _ListResult({final List<T>? data, final ResultStatus? status}) =
      _$_ListResult<T>;

  @override
  List<T>? get data;
  @override
  ResultStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$_ListResultCopyWith<T, _$_ListResult<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
