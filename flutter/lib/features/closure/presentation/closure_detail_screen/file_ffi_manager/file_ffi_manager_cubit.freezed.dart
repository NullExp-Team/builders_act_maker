// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_ffi_manager_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FileFfiManagerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FileFfiManagerStateLoaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FileFfiManagerStateLoaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileFfiManagerStateLoaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileFfiManagerStateCopyWith<$Res> {
  factory $FileFfiManagerStateCopyWith(
          FileFfiManagerState value, $Res Function(FileFfiManagerState) then) =
      _$FileFfiManagerStateCopyWithImpl<$Res, FileFfiManagerState>;
}

/// @nodoc
class _$FileFfiManagerStateCopyWithImpl<$Res, $Val extends FileFfiManagerState>
    implements $FileFfiManagerStateCopyWith<$Res> {
  _$FileFfiManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FileFfiManagerStateLoadedCopyWith<$Res> {
  factory _$$FileFfiManagerStateLoadedCopyWith(
          _$FileFfiManagerStateLoaded value,
          $Res Function(_$FileFfiManagerStateLoaded) then) =
      __$$FileFfiManagerStateLoadedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FileFfiManagerStateLoadedCopyWithImpl<$Res>
    extends _$FileFfiManagerStateCopyWithImpl<$Res, _$FileFfiManagerStateLoaded>
    implements _$$FileFfiManagerStateLoadedCopyWith<$Res> {
  __$$FileFfiManagerStateLoadedCopyWithImpl(_$FileFfiManagerStateLoaded _value,
      $Res Function(_$FileFfiManagerStateLoaded) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FileFfiManagerStateLoaded implements FileFfiManagerStateLoaded {
  const _$FileFfiManagerStateLoaded();

  @override
  String toString() {
    return 'FileFfiManagerState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileFfiManagerStateLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loaded,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loaded,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FileFfiManagerStateLoaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FileFfiManagerStateLoaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FileFfiManagerStateLoaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class FileFfiManagerStateLoaded implements FileFfiManagerState {
  const factory FileFfiManagerStateLoaded() = _$FileFfiManagerStateLoaded;
}
