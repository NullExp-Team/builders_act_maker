// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editor_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ActData act, bool isNameEditing) loaded,
    required TResult Function() init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ActData act, bool isNameEditing)? loaded,
    TResult? Function()? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ActData act, bool isNameEditing)? loaded,
    TResult Function()? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorStateLoaded value) loaded,
    required TResult Function(EditorStateInit value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorStateLoaded value)? loaded,
    TResult? Function(EditorStateInit value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorStateLoaded value)? loaded,
    TResult Function(EditorStateInit value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditorStateCopyWith<$Res> {
  factory $EditorStateCopyWith(
          EditorState value, $Res Function(EditorState) then) =
      _$EditorStateCopyWithImpl<$Res, EditorState>;
}

/// @nodoc
class _$EditorStateCopyWithImpl<$Res, $Val extends EditorState>
    implements $EditorStateCopyWith<$Res> {
  _$EditorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EditorStateLoadedCopyWith<$Res> {
  factory _$$EditorStateLoadedCopyWith(
          _$EditorStateLoaded value, $Res Function(_$EditorStateLoaded) then) =
      __$$EditorStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({ActData act, bool isNameEditing});

  $ActDataCopyWith<$Res> get act;
}

/// @nodoc
class __$$EditorStateLoadedCopyWithImpl<$Res>
    extends _$EditorStateCopyWithImpl<$Res, _$EditorStateLoaded>
    implements _$$EditorStateLoadedCopyWith<$Res> {
  __$$EditorStateLoadedCopyWithImpl(
      _$EditorStateLoaded _value, $Res Function(_$EditorStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? act = null,
    Object? isNameEditing = null,
  }) {
    return _then(_$EditorStateLoaded(
      act: null == act
          ? _value.act
          : act // ignore: cast_nullable_to_non_nullable
              as ActData,
      isNameEditing: null == isNameEditing
          ? _value.isNameEditing
          : isNameEditing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ActDataCopyWith<$Res> get act {
    return $ActDataCopyWith<$Res>(_value.act, (value) {
      return _then(_value.copyWith(act: value));
    });
  }
}

/// @nodoc

class _$EditorStateLoaded implements EditorStateLoaded {
  const _$EditorStateLoaded({required this.act, required this.isNameEditing});

  @override
  final ActData act;
  @override
  final bool isNameEditing;

  @override
  String toString() {
    return 'EditorState.loaded(act: $act, isNameEditing: $isNameEditing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorStateLoaded &&
            (identical(other.act, act) || other.act == act) &&
            (identical(other.isNameEditing, isNameEditing) ||
                other.isNameEditing == isNameEditing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, act, isNameEditing);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorStateLoadedCopyWith<_$EditorStateLoaded> get copyWith =>
      __$$EditorStateLoadedCopyWithImpl<_$EditorStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ActData act, bool isNameEditing) loaded,
    required TResult Function() init,
  }) {
    return loaded(act, isNameEditing);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ActData act, bool isNameEditing)? loaded,
    TResult? Function()? init,
  }) {
    return loaded?.call(act, isNameEditing);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ActData act, bool isNameEditing)? loaded,
    TResult Function()? init,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(act, isNameEditing);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorStateLoaded value) loaded,
    required TResult Function(EditorStateInit value) init,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorStateLoaded value)? loaded,
    TResult? Function(EditorStateInit value)? init,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorStateLoaded value)? loaded,
    TResult Function(EditorStateInit value)? init,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class EditorStateLoaded implements EditorState {
  const factory EditorStateLoaded(
      {required final ActData act,
      required final bool isNameEditing}) = _$EditorStateLoaded;

  ActData get act;
  bool get isNameEditing;
  @JsonKey(ignore: true)
  _$$EditorStateLoadedCopyWith<_$EditorStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditorStateInitCopyWith<$Res> {
  factory _$$EditorStateInitCopyWith(
          _$EditorStateInit value, $Res Function(_$EditorStateInit) then) =
      __$$EditorStateInitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditorStateInitCopyWithImpl<$Res>
    extends _$EditorStateCopyWithImpl<$Res, _$EditorStateInit>
    implements _$$EditorStateInitCopyWith<$Res> {
  __$$EditorStateInitCopyWithImpl(
      _$EditorStateInit _value, $Res Function(_$EditorStateInit) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EditorStateInit implements EditorStateInit {
  const _$EditorStateInit();

  @override
  String toString() {
    return 'EditorState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditorStateInit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ActData act, bool isNameEditing) loaded,
    required TResult Function() init,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ActData act, bool isNameEditing)? loaded,
    TResult? Function()? init,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ActData act, bool isNameEditing)? loaded,
    TResult Function()? init,
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
    required TResult Function(EditorStateLoaded value) loaded,
    required TResult Function(EditorStateInit value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorStateLoaded value)? loaded,
    TResult? Function(EditorStateInit value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorStateLoaded value)? loaded,
    TResult Function(EditorStateInit value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class EditorStateInit implements EditorState {
  const factory EditorStateInit() = _$EditorStateInit;
}
