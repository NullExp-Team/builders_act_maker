// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'closure_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ClosureState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Closure> closures) loaded,
    required TResult Function(dynamic message, StackTrace stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Closure> closures)? loaded,
    TResult? Function(dynamic message, StackTrace stackTrace)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Closure> closures)? loaded,
    TResult Function(dynamic message, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClosureInitialState value) initial,
    required TResult Function(ClosureLoadingState value) loading,
    required TResult Function(ClosureLoadedState value) loaded,
    required TResult Function(ClosureErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClosureInitialState value)? initial,
    TResult? Function(ClosureLoadingState value)? loading,
    TResult? Function(ClosureLoadedState value)? loaded,
    TResult? Function(ClosureErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClosureInitialState value)? initial,
    TResult Function(ClosureLoadingState value)? loading,
    TResult Function(ClosureLoadedState value)? loaded,
    TResult Function(ClosureErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosureStateCopyWith<$Res> {
  factory $ClosureStateCopyWith(
          ClosureState value, $Res Function(ClosureState) then) =
      _$ClosureStateCopyWithImpl<$Res, ClosureState>;
}

/// @nodoc
class _$ClosureStateCopyWithImpl<$Res, $Val extends ClosureState>
    implements $ClosureStateCopyWith<$Res> {
  _$ClosureStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ClosureInitialStateCopyWith<$Res> {
  factory _$$ClosureInitialStateCopyWith(_$ClosureInitialState value,
          $Res Function(_$ClosureInitialState) then) =
      __$$ClosureInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClosureInitialStateCopyWithImpl<$Res>
    extends _$ClosureStateCopyWithImpl<$Res, _$ClosureInitialState>
    implements _$$ClosureInitialStateCopyWith<$Res> {
  __$$ClosureInitialStateCopyWithImpl(
      _$ClosureInitialState _value, $Res Function(_$ClosureInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClosureInitialState implements ClosureInitialState {
  const _$ClosureInitialState();

  @override
  String toString() {
    return 'ClosureState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClosureInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Closure> closures) loaded,
    required TResult Function(dynamic message, StackTrace stackTrace) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Closure> closures)? loaded,
    TResult? Function(dynamic message, StackTrace stackTrace)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Closure> closures)? loaded,
    TResult Function(dynamic message, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClosureInitialState value) initial,
    required TResult Function(ClosureLoadingState value) loading,
    required TResult Function(ClosureLoadedState value) loaded,
    required TResult Function(ClosureErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClosureInitialState value)? initial,
    TResult? Function(ClosureLoadingState value)? loading,
    TResult? Function(ClosureLoadedState value)? loaded,
    TResult? Function(ClosureErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClosureInitialState value)? initial,
    TResult Function(ClosureLoadingState value)? loading,
    TResult Function(ClosureLoadedState value)? loaded,
    TResult Function(ClosureErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ClosureInitialState implements ClosureState {
  const factory ClosureInitialState() = _$ClosureInitialState;
}

/// @nodoc
abstract class _$$ClosureLoadingStateCopyWith<$Res> {
  factory _$$ClosureLoadingStateCopyWith(_$ClosureLoadingState value,
          $Res Function(_$ClosureLoadingState) then) =
      __$$ClosureLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClosureLoadingStateCopyWithImpl<$Res>
    extends _$ClosureStateCopyWithImpl<$Res, _$ClosureLoadingState>
    implements _$$ClosureLoadingStateCopyWith<$Res> {
  __$$ClosureLoadingStateCopyWithImpl(
      _$ClosureLoadingState _value, $Res Function(_$ClosureLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClosureLoadingState implements ClosureLoadingState {
  const _$ClosureLoadingState();

  @override
  String toString() {
    return 'ClosureState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClosureLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Closure> closures) loaded,
    required TResult Function(dynamic message, StackTrace stackTrace) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Closure> closures)? loaded,
    TResult? Function(dynamic message, StackTrace stackTrace)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Closure> closures)? loaded,
    TResult Function(dynamic message, StackTrace stackTrace)? error,
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
    required TResult Function(ClosureInitialState value) initial,
    required TResult Function(ClosureLoadingState value) loading,
    required TResult Function(ClosureLoadedState value) loaded,
    required TResult Function(ClosureErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClosureInitialState value)? initial,
    TResult? Function(ClosureLoadingState value)? loading,
    TResult? Function(ClosureLoadedState value)? loaded,
    TResult? Function(ClosureErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClosureInitialState value)? initial,
    TResult Function(ClosureLoadingState value)? loading,
    TResult Function(ClosureLoadedState value)? loaded,
    TResult Function(ClosureErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ClosureLoadingState implements ClosureState {
  const factory ClosureLoadingState() = _$ClosureLoadingState;
}

/// @nodoc
abstract class _$$ClosureLoadedStateCopyWith<$Res> {
  factory _$$ClosureLoadedStateCopyWith(_$ClosureLoadedState value,
          $Res Function(_$ClosureLoadedState) then) =
      __$$ClosureLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Closure> closures});
}

/// @nodoc
class __$$ClosureLoadedStateCopyWithImpl<$Res>
    extends _$ClosureStateCopyWithImpl<$Res, _$ClosureLoadedState>
    implements _$$ClosureLoadedStateCopyWith<$Res> {
  __$$ClosureLoadedStateCopyWithImpl(
      _$ClosureLoadedState _value, $Res Function(_$ClosureLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? closures = null,
  }) {
    return _then(_$ClosureLoadedState(
      closures: null == closures
          ? _value._closures
          : closures // ignore: cast_nullable_to_non_nullable
              as List<Closure>,
    ));
  }
}

/// @nodoc

class _$ClosureLoadedState implements ClosureLoadedState {
  const _$ClosureLoadedState({required final List<Closure> closures})
      : _closures = closures;

  final List<Closure> _closures;
  @override
  List<Closure> get closures {
    if (_closures is EqualUnmodifiableListView) return _closures;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_closures);
  }

  @override
  String toString() {
    return 'ClosureState.loaded(closures: $closures)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosureLoadedState &&
            const DeepCollectionEquality().equals(other._closures, _closures));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_closures));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosureLoadedStateCopyWith<_$ClosureLoadedState> get copyWith =>
      __$$ClosureLoadedStateCopyWithImpl<_$ClosureLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Closure> closures) loaded,
    required TResult Function(dynamic message, StackTrace stackTrace) error,
  }) {
    return loaded(closures);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Closure> closures)? loaded,
    TResult? Function(dynamic message, StackTrace stackTrace)? error,
  }) {
    return loaded?.call(closures);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Closure> closures)? loaded,
    TResult Function(dynamic message, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(closures);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClosureInitialState value) initial,
    required TResult Function(ClosureLoadingState value) loading,
    required TResult Function(ClosureLoadedState value) loaded,
    required TResult Function(ClosureErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClosureInitialState value)? initial,
    TResult? Function(ClosureLoadingState value)? loading,
    TResult? Function(ClosureLoadedState value)? loaded,
    TResult? Function(ClosureErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClosureInitialState value)? initial,
    TResult Function(ClosureLoadingState value)? loading,
    TResult Function(ClosureLoadedState value)? loaded,
    TResult Function(ClosureErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ClosureLoadedState implements ClosureState {
  const factory ClosureLoadedState({required final List<Closure> closures}) =
      _$ClosureLoadedState;

  List<Closure> get closures;
  @JsonKey(ignore: true)
  _$$ClosureLoadedStateCopyWith<_$ClosureLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClosureErrorStateCopyWith<$Res> {
  factory _$$ClosureErrorStateCopyWith(
          _$ClosureErrorState value, $Res Function(_$ClosureErrorState) then) =
      __$$ClosureErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic message, StackTrace stackTrace});
}

/// @nodoc
class __$$ClosureErrorStateCopyWithImpl<$Res>
    extends _$ClosureStateCopyWithImpl<$Res, _$ClosureErrorState>
    implements _$$ClosureErrorStateCopyWith<$Res> {
  __$$ClosureErrorStateCopyWithImpl(
      _$ClosureErrorState _value, $Res Function(_$ClosureErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? stackTrace = null,
  }) {
    return _then(_$ClosureErrorState(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as dynamic,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$ClosureErrorState implements ClosureErrorState {
  const _$ClosureErrorState({required this.message, required this.stackTrace});

  @override
  final dynamic message;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'ClosureState.error(message: $message, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClosureErrorState &&
            const DeepCollectionEquality().equals(other.message, message) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(message), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClosureErrorStateCopyWith<_$ClosureErrorState> get copyWith =>
      __$$ClosureErrorStateCopyWithImpl<_$ClosureErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Closure> closures) loaded,
    required TResult Function(dynamic message, StackTrace stackTrace) error,
  }) {
    return error(message, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Closure> closures)? loaded,
    TResult? Function(dynamic message, StackTrace stackTrace)? error,
  }) {
    return error?.call(message, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Closure> closures)? loaded,
    TResult Function(dynamic message, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ClosureInitialState value) initial,
    required TResult Function(ClosureLoadingState value) loading,
    required TResult Function(ClosureLoadedState value) loaded,
    required TResult Function(ClosureErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ClosureInitialState value)? initial,
    TResult? Function(ClosureLoadingState value)? loading,
    TResult? Function(ClosureLoadedState value)? loaded,
    TResult? Function(ClosureErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ClosureInitialState value)? initial,
    TResult Function(ClosureLoadingState value)? loading,
    TResult Function(ClosureLoadedState value)? loaded,
    TResult Function(ClosureErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ClosureErrorState implements ClosureState {
  const factory ClosureErrorState(
      {required final dynamic message,
      required final StackTrace stackTrace}) = _$ClosureErrorState;

  dynamic get message;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$$ClosureErrorStateCopyWith<_$ClosureErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}
