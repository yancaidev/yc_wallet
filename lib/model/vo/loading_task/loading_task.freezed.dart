// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'loading_task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoadingTask<R> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function(R result) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function(R result)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function(R result)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init<R> value) init,
    required TResult Function(Loading<R> value) loading,
    required TResult Function(Error<R> value) error,
    required TResult Function(Success<R> value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init<R> value)? init,
    TResult Function(Loading<R> value)? loading,
    TResult Function(Error<R> value)? error,
    TResult Function(Success<R> value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init<R> value)? init,
    TResult Function(Loading<R> value)? loading,
    TResult Function(Error<R> value)? error,
    TResult Function(Success<R> value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingTaskCopyWith<R, $Res> {
  factory $LoadingTaskCopyWith(
          LoadingTask<R> value, $Res Function(LoadingTask<R>) then) =
      _$LoadingTaskCopyWithImpl<R, $Res>;
}

/// @nodoc
class _$LoadingTaskCopyWithImpl<R, $Res>
    implements $LoadingTaskCopyWith<R, $Res> {
  _$LoadingTaskCopyWithImpl(this._value, this._then);

  final LoadingTask<R> _value;
  // ignore: unused_field
  final $Res Function(LoadingTask<R>) _then;
}

/// @nodoc
abstract class _$$InitCopyWith<R, $Res> {
  factory _$$InitCopyWith(_$Init<R> value, $Res Function(_$Init<R>) then) =
      __$$InitCopyWithImpl<R, $Res>;
}

/// @nodoc
class __$$InitCopyWithImpl<R, $Res> extends _$LoadingTaskCopyWithImpl<R, $Res>
    implements _$$InitCopyWith<R, $Res> {
  __$$InitCopyWithImpl(_$Init<R> _value, $Res Function(_$Init<R>) _then)
      : super(_value, (v) => _then(v as _$Init<R>));

  @override
  _$Init<R> get _value => super._value as _$Init<R>;
}

/// @nodoc

class _$Init<R> implements Init<R> {
  const _$Init();

  @override
  String toString() {
    return 'LoadingTask<$R>.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Init<R>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function(R result) success,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function(R result)? success,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function(R result)? success,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init<R> value) init,
    required TResult Function(Loading<R> value) loading,
    required TResult Function(Error<R> value) error,
    required TResult Function(Success<R> value) success,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init<R> value)? init,
    TResult Function(Loading<R> value)? loading,
    TResult Function(Error<R> value)? error,
    TResult Function(Success<R> value)? success,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init<R> value)? init,
    TResult Function(Loading<R> value)? loading,
    TResult Function(Error<R> value)? error,
    TResult Function(Success<R> value)? success,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init<R> implements LoadingTask<R> {
  const factory Init() = _$Init<R>;
}

/// @nodoc
abstract class _$$LoadingCopyWith<R, $Res> {
  factory _$$LoadingCopyWith(
          _$Loading<R> value, $Res Function(_$Loading<R>) then) =
      __$$LoadingCopyWithImpl<R, $Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<R, $Res>
    extends _$LoadingTaskCopyWithImpl<R, $Res>
    implements _$$LoadingCopyWith<R, $Res> {
  __$$LoadingCopyWithImpl(
      _$Loading<R> _value, $Res Function(_$Loading<R>) _then)
      : super(_value, (v) => _then(v as _$Loading<R>));

  @override
  _$Loading<R> get _value => super._value as _$Loading<R>;
}

/// @nodoc

class _$Loading<R> implements Loading<R> {
  const _$Loading();

  @override
  String toString() {
    return 'LoadingTask<$R>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading<R>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function(R result) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function(R result)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function(R result)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init<R> value) init,
    required TResult Function(Loading<R> value) loading,
    required TResult Function(Error<R> value) error,
    required TResult Function(Success<R> value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init<R> value)? init,
    TResult Function(Loading<R> value)? loading,
    TResult Function(Error<R> value)? error,
    TResult Function(Success<R> value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init<R> value)? init,
    TResult Function(Loading<R> value)? loading,
    TResult Function(Error<R> value)? error,
    TResult Function(Success<R> value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<R> implements LoadingTask<R> {
  const factory Loading() = _$Loading<R>;
}

/// @nodoc
abstract class _$$ErrorCopyWith<R, $Res> {
  factory _$$ErrorCopyWith(_$Error<R> value, $Res Function(_$Error<R>) then) =
      __$$ErrorCopyWithImpl<R, $Res>;
  $Res call({Object error});
}

/// @nodoc
class __$$ErrorCopyWithImpl<R, $Res> extends _$LoadingTaskCopyWithImpl<R, $Res>
    implements _$$ErrorCopyWith<R, $Res> {
  __$$ErrorCopyWithImpl(_$Error<R> _value, $Res Function(_$Error<R>) _then)
      : super(_value, (v) => _then(v as _$Error<R>));

  @override
  _$Error<R> get _value => super._value as _$Error<R>;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$Error<R>(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Object,
    ));
  }
}

/// @nodoc

class _$Error<R> implements Error<R> {
  const _$Error(this.error);

  @override
  final Object error;

  @override
  String toString() {
    return 'LoadingTask<$R>.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error<R> &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$ErrorCopyWith<R, _$Error<R>> get copyWith =>
      __$$ErrorCopyWithImpl<R, _$Error<R>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function(R result) success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function(R result)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function(R result)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init<R> value) init,
    required TResult Function(Loading<R> value) loading,
    required TResult Function(Error<R> value) error,
    required TResult Function(Success<R> value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init<R> value)? init,
    TResult Function(Loading<R> value)? loading,
    TResult Function(Error<R> value)? error,
    TResult Function(Success<R> value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init<R> value)? init,
    TResult Function(Loading<R> value)? loading,
    TResult Function(Error<R> value)? error,
    TResult Function(Success<R> value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<R> implements LoadingTask<R> {
  const factory Error(final Object error) = _$Error<R>;

  Object get error;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<R, _$Error<R>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessCopyWith<R, $Res> {
  factory _$$SuccessCopyWith(
          _$Success<R> value, $Res Function(_$Success<R>) then) =
      __$$SuccessCopyWithImpl<R, $Res>;
  $Res call({R result});
}

/// @nodoc
class __$$SuccessCopyWithImpl<R, $Res>
    extends _$LoadingTaskCopyWithImpl<R, $Res>
    implements _$$SuccessCopyWith<R, $Res> {
  __$$SuccessCopyWithImpl(
      _$Success<R> _value, $Res Function(_$Success<R>) _then)
      : super(_value, (v) => _then(v as _$Success<R>));

  @override
  _$Success<R> get _value => super._value as _$Success<R>;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_$Success<R>(
      result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as R,
    ));
  }
}

/// @nodoc

class _$Success<R> implements Success<R> {
  const _$Success(this.result);

  @override
  final R result;

  @override
  String toString() {
    return 'LoadingTask<$R>.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success<R> &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  _$$SuccessCopyWith<R, _$Success<R>> get copyWith =>
      __$$SuccessCopyWithImpl<R, _$Success<R>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loading,
    required TResult Function(Object error) error,
    required TResult Function(R result) success,
  }) {
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function(R result)? success,
  }) {
    return success?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loading,
    TResult Function(Object error)? error,
    TResult Function(R result)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init<R> value) init,
    required TResult Function(Loading<R> value) loading,
    required TResult Function(Error<R> value) error,
    required TResult Function(Success<R> value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Init<R> value)? init,
    TResult Function(Loading<R> value)? loading,
    TResult Function(Error<R> value)? error,
    TResult Function(Success<R> value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init<R> value)? init,
    TResult Function(Loading<R> value)? loading,
    TResult Function(Error<R> value)? error,
    TResult Function(Success<R> value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<R> implements LoadingTask<R> {
  const factory Success(final R result) = _$Success<R>;

  R get result;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<R, _$Success<R>> get copyWith =>
      throw _privateConstructorUsedError;
}
