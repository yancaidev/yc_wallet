// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quote_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuoteResult _$QuoteResultFromJson(Map<String, dynamic> json) {
  return _QuoteResult.fromJson(json);
}

/// @nodoc
mixin _$QuoteResult {
  Map<String, List<CurrencyQuote>>? get data =>
      throw _privateConstructorUsedError;
  ResultStatus? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuoteResultCopyWith<QuoteResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuoteResultCopyWith<$Res> {
  factory $QuoteResultCopyWith(
          QuoteResult value, $Res Function(QuoteResult) then) =
      _$QuoteResultCopyWithImpl<$Res>;
  $Res call({Map<String, List<CurrencyQuote>>? data, ResultStatus? status});

  $ResultStatusCopyWith<$Res>? get status;
}

/// @nodoc
class _$QuoteResultCopyWithImpl<$Res> implements $QuoteResultCopyWith<$Res> {
  _$QuoteResultCopyWithImpl(this._value, this._then);

  final QuoteResult _value;
  // ignore: unused_field
  final $Res Function(QuoteResult) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, List<CurrencyQuote>>?,
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
abstract class _$$_QuoteResultCopyWith<$Res>
    implements $QuoteResultCopyWith<$Res> {
  factory _$$_QuoteResultCopyWith(
          _$_QuoteResult value, $Res Function(_$_QuoteResult) then) =
      __$$_QuoteResultCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, List<CurrencyQuote>>? data, ResultStatus? status});

  @override
  $ResultStatusCopyWith<$Res>? get status;
}

/// @nodoc
class __$$_QuoteResultCopyWithImpl<$Res> extends _$QuoteResultCopyWithImpl<$Res>
    implements _$$_QuoteResultCopyWith<$Res> {
  __$$_QuoteResultCopyWithImpl(
      _$_QuoteResult _value, $Res Function(_$_QuoteResult) _then)
      : super(_value, (v) => _then(v as _$_QuoteResult));

  @override
  _$_QuoteResult get _value => super._value as _$_QuoteResult;

  @override
  $Res call({
    Object? data = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_QuoteResult(
      data: data == freezed
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, List<CurrencyQuote>>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ResultStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuoteResult implements _QuoteResult {
  _$_QuoteResult({final Map<String, List<CurrencyQuote>>? data, this.status})
      : _data = data;

  factory _$_QuoteResult.fromJson(Map<String, dynamic> json) =>
      _$$_QuoteResultFromJson(json);

  final Map<String, List<CurrencyQuote>>? _data;
  @override
  Map<String, List<CurrencyQuote>>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final ResultStatus? status;

  @override
  String toString() {
    return 'QuoteResult(data: $data, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuoteResult &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_QuoteResultCopyWith<_$_QuoteResult> get copyWith =>
      __$$_QuoteResultCopyWithImpl<_$_QuoteResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuoteResultToJson(this);
  }
}

abstract class _QuoteResult implements QuoteResult {
  factory _QuoteResult(
      {final Map<String, List<CurrencyQuote>>? data,
      final ResultStatus? status}) = _$_QuoteResult;

  factory _QuoteResult.fromJson(Map<String, dynamic> json) =
      _$_QuoteResult.fromJson;

  @override
  Map<String, List<CurrencyQuote>>? get data;
  @override
  ResultStatus? get status;
  @override
  @JsonKey(ignore: true)
  _$$_QuoteResultCopyWith<_$_QuoteResult> get copyWith =>
      throw _privateConstructorUsedError;
}
