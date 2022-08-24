// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'result_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResultStatus _$ResultStatusFromJson(Map<String, dynamic> json) {
  return _ResultStatus.fromJson(json);
}

/// @nodoc
mixin _$ResultStatus {
  DateTime? get timestamp => throw _privateConstructorUsedError;
  @JsonKey(name: 'error_code')
  int? get errorCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'error_message')
  String? get errorMessage => throw _privateConstructorUsedError;
  int? get elapsed => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit_count')
  int? get creditCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultStatusCopyWith<ResultStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultStatusCopyWith<$Res> {
  factory $ResultStatusCopyWith(
          ResultStatus value, $Res Function(ResultStatus) then) =
      _$ResultStatusCopyWithImpl<$Res>;
  $Res call(
      {DateTime? timestamp,
      @JsonKey(name: 'error_code') int? errorCode,
      @JsonKey(name: 'error_message') String? errorMessage,
      int? elapsed,
      @JsonKey(name: 'credit_count') int? creditCount});
}

/// @nodoc
class _$ResultStatusCopyWithImpl<$Res> implements $ResultStatusCopyWith<$Res> {
  _$ResultStatusCopyWithImpl(this._value, this._then);

  final ResultStatus _value;
  // ignore: unused_field
  final $Res Function(ResultStatus) _then;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? errorCode = freezed,
    Object? errorMessage = freezed,
    Object? elapsed = freezed,
    Object? creditCount = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      errorCode: errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      elapsed: elapsed == freezed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as int?,
      creditCount: creditCount == freezed
          ? _value.creditCount
          : creditCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_ResultStatusCopyWith<$Res>
    implements $ResultStatusCopyWith<$Res> {
  factory _$$_ResultStatusCopyWith(
          _$_ResultStatus value, $Res Function(_$_ResultStatus) then) =
      __$$_ResultStatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime? timestamp,
      @JsonKey(name: 'error_code') int? errorCode,
      @JsonKey(name: 'error_message') String? errorMessage,
      int? elapsed,
      @JsonKey(name: 'credit_count') int? creditCount});
}

/// @nodoc
class __$$_ResultStatusCopyWithImpl<$Res>
    extends _$ResultStatusCopyWithImpl<$Res>
    implements _$$_ResultStatusCopyWith<$Res> {
  __$$_ResultStatusCopyWithImpl(
      _$_ResultStatus _value, $Res Function(_$_ResultStatus) _then)
      : super(_value, (v) => _then(v as _$_ResultStatus));

  @override
  _$_ResultStatus get _value => super._value as _$_ResultStatus;

  @override
  $Res call({
    Object? timestamp = freezed,
    Object? errorCode = freezed,
    Object? errorMessage = freezed,
    Object? elapsed = freezed,
    Object? creditCount = freezed,
  }) {
    return _then(_$_ResultStatus(
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      errorCode: errorCode == freezed
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as int?,
      errorMessage: errorMessage == freezed
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      elapsed: elapsed == freezed
          ? _value.elapsed
          : elapsed // ignore: cast_nullable_to_non_nullable
              as int?,
      creditCount: creditCount == freezed
          ? _value.creditCount
          : creditCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResultStatus implements _ResultStatus {
  _$_ResultStatus(
      {this.timestamp,
      @JsonKey(name: 'error_code') this.errorCode,
      @JsonKey(name: 'error_message') this.errorMessage,
      this.elapsed,
      @JsonKey(name: 'credit_count') this.creditCount});

  factory _$_ResultStatus.fromJson(Map<String, dynamic> json) =>
      _$$_ResultStatusFromJson(json);

  @override
  final DateTime? timestamp;
  @override
  @JsonKey(name: 'error_code')
  final int? errorCode;
  @override
  @JsonKey(name: 'error_message')
  final String? errorMessage;
  @override
  final int? elapsed;
  @override
  @JsonKey(name: 'credit_count')
  final int? creditCount;

  @override
  String toString() {
    return 'ResultStatus(timestamp: $timestamp, errorCode: $errorCode, errorMessage: $errorMessage, elapsed: $elapsed, creditCount: $creditCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResultStatus &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.errorCode, errorCode) &&
            const DeepCollectionEquality()
                .equals(other.errorMessage, errorMessage) &&
            const DeepCollectionEquality().equals(other.elapsed, elapsed) &&
            const DeepCollectionEquality()
                .equals(other.creditCount, creditCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(errorCode),
      const DeepCollectionEquality().hash(errorMessage),
      const DeepCollectionEquality().hash(elapsed),
      const DeepCollectionEquality().hash(creditCount));

  @JsonKey(ignore: true)
  @override
  _$$_ResultStatusCopyWith<_$_ResultStatus> get copyWith =>
      __$$_ResultStatusCopyWithImpl<_$_ResultStatus>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultStatusToJson(this);
  }
}

abstract class _ResultStatus implements ResultStatus {
  factory _ResultStatus(
      {final DateTime? timestamp,
      @JsonKey(name: 'error_code') final int? errorCode,
      @JsonKey(name: 'error_message') final String? errorMessage,
      final int? elapsed,
      @JsonKey(name: 'credit_count') final int? creditCount}) = _$_ResultStatus;

  factory _ResultStatus.fromJson(Map<String, dynamic> json) =
      _$_ResultStatus.fromJson;

  @override
  DateTime? get timestamp;
  @override
  @JsonKey(name: 'error_code')
  int? get errorCode;
  @override
  @JsonKey(name: 'error_message')
  String? get errorMessage;
  @override
  int? get elapsed;
  @override
  @JsonKey(name: 'credit_count')
  int? get creditCount;
  @override
  @JsonKey(ignore: true)
  _$$_ResultStatusCopyWith<_$_ResultStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
