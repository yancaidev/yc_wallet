// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Result<T> {
  T? get data => throw _privateConstructorUsedError;
  ResultStatus? get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ResultCopyWith<T, Result<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<T, $Res> {
  factory $ResultCopyWith(Result<T> value, $Res Function(Result<T>) then) =
      _$ResultCopyWithImpl<T, $Res>;
  $Res call({T? data, ResultStatus? status});

  $ResultStatusCopyWith<$Res>? get status;
}

/// @nodoc
class _$ResultCopyWithImpl<T, $Res> implements $ResultCopyWith<T, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  final Result<T> _value;
  // ignore: unused_field
  final $Res Function(Result<T>) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
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
abstract class _$$_ResultCopyWith<T, $Res> implements $ResultCopyWith<T, $Res> {
  factory _$$_ResultCopyWith(
          _$_Result<T> value, $Res Function(_$_Result<T>) then) =
      __$$_ResultCopyWithImpl<T, $Res>;
  @override
  $Res call({T? data, ResultStatus? status});

  @override
  $ResultStatusCopyWith<$Res>? get status;
}

/// @nodoc
class __$$_ResultCopyWithImpl<T, $Res> extends _$ResultCopyWithImpl<T, $Res>
    implements _$$_ResultCopyWith<T, $Res> {
  __$$_ResultCopyWithImpl(
      _$_Result<T> _value, $Res Function(_$_Result<T>) _then)
      : super(_value, (v) => _then(v as _$_Result<T>));

  @override
  _$_Result<T> get _value => super._value as _$_Result<T>;

  @override
  $Res call({
    Object? data = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_Result<T>(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ResultStatus?,
    ));
  }
}

/// @nodoc

class _$_Result<T> implements _Result<T> {
  const _$_Result({this.data, this.status});

  @override
  final T? data;
  @override
  final ResultStatus? status;

  @override
  String toString() {
    return 'Result<$T>(data: $data, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_ResultCopyWith<T, _$_Result<T>> get copyWith =>
      __$$_ResultCopyWithImpl<T, _$_Result<T>>(this, _$identity);
}

abstract class _Result<T> implements Result<T> {
  const factory _Result({final T? data, final ResultStatus? status}) =
      _$_Result<T>;

  @override
  T? get data;
  @override
  ResultStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<T, _$_Result<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
