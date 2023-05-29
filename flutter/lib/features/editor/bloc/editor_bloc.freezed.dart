// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int fieldIndex, String text, List<int>? dependedFields)
        editField,
    required TResult Function(int fieldIndex, String subText) editSubField,
    required TResult Function() save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int fieldIndex, String text, List<int>? dependedFields)?
        editField,
    TResult? Function(int fieldIndex, String subText)? editSubField,
    TResult? Function()? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int fieldIndex, String text, List<int>? dependedFields)?
        editField,
    TResult Function(int fieldIndex, String subText)? editSubField,
    TResult Function()? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditField value) editField,
    required TResult Function(_EditSubField value) editSubField,
    required TResult Function(_Save value) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditField value)? editField,
    TResult? Function(_EditSubField value)? editSubField,
    TResult? Function(_Save value)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditField value)? editField,
    TResult Function(_EditSubField value)? editSubField,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditorEventCopyWith<$Res> {
  factory $EditorEventCopyWith(
          EditorEvent value, $Res Function(EditorEvent) then) =
      _$EditorEventCopyWithImpl<$Res, EditorEvent>;
}

/// @nodoc
class _$EditorEventCopyWithImpl<$Res, $Val extends EditorEvent>
    implements $EditorEventCopyWith<$Res> {
  _$EditorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_EditFieldCopyWith<$Res> {
  factory _$$_EditFieldCopyWith(
          _$_EditField value, $Res Function(_$_EditField) then) =
      __$$_EditFieldCopyWithImpl<$Res>;
  @useResult
  $Res call({int fieldIndex, String text, List<int>? dependedFields});
}

/// @nodoc
class __$$_EditFieldCopyWithImpl<$Res>
    extends _$EditorEventCopyWithImpl<$Res, _$_EditField>
    implements _$$_EditFieldCopyWith<$Res> {
  __$$_EditFieldCopyWithImpl(
      _$_EditField _value, $Res Function(_$_EditField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldIndex = null,
    Object? text = null,
    Object? dependedFields = freezed,
  }) {
    return _then(_$_EditField(
      fieldIndex: null == fieldIndex
          ? _value.fieldIndex
          : fieldIndex // ignore: cast_nullable_to_non_nullable
              as int,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      dependedFields: freezed == dependedFields
          ? _value._dependedFields
          : dependedFields // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc

class _$_EditField implements _EditField {
  const _$_EditField(
      {required this.fieldIndex,
      required this.text,
      final List<int>? dependedFields})
      : _dependedFields = dependedFields;

  @override
  final int fieldIndex;
  @override
  final String text;
  final List<int>? _dependedFields;
  @override
  List<int>? get dependedFields {
    final value = _dependedFields;
    if (value == null) return null;
    if (_dependedFields is EqualUnmodifiableListView) return _dependedFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EditorEvent.editField(fieldIndex: $fieldIndex, text: $text, dependedFields: $dependedFields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditField &&
            (identical(other.fieldIndex, fieldIndex) ||
                other.fieldIndex == fieldIndex) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality()
                .equals(other._dependedFields, _dependedFields));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fieldIndex, text,
      const DeepCollectionEquality().hash(_dependedFields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditFieldCopyWith<_$_EditField> get copyWith =>
      __$$_EditFieldCopyWithImpl<_$_EditField>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int fieldIndex, String text, List<int>? dependedFields)
        editField,
    required TResult Function(int fieldIndex, String subText) editSubField,
    required TResult Function() save,
  }) {
    return editField(fieldIndex, text, dependedFields);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int fieldIndex, String text, List<int>? dependedFields)?
        editField,
    TResult? Function(int fieldIndex, String subText)? editSubField,
    TResult? Function()? save,
  }) {
    return editField?.call(fieldIndex, text, dependedFields);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int fieldIndex, String text, List<int>? dependedFields)?
        editField,
    TResult Function(int fieldIndex, String subText)? editSubField,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (editField != null) {
      return editField(fieldIndex, text, dependedFields);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditField value) editField,
    required TResult Function(_EditSubField value) editSubField,
    required TResult Function(_Save value) save,
  }) {
    return editField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditField value)? editField,
    TResult? Function(_EditSubField value)? editSubField,
    TResult? Function(_Save value)? save,
  }) {
    return editField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditField value)? editField,
    TResult Function(_EditSubField value)? editSubField,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (editField != null) {
      return editField(this);
    }
    return orElse();
  }
}

abstract class _EditField implements EditorEvent {
  const factory _EditField(
      {required final int fieldIndex,
      required final String text,
      final List<int>? dependedFields}) = _$_EditField;

  int get fieldIndex;
  String get text;
  List<int>? get dependedFields;
  @JsonKey(ignore: true)
  _$$_EditFieldCopyWith<_$_EditField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EditSubFieldCopyWith<$Res> {
  factory _$$_EditSubFieldCopyWith(
          _$_EditSubField value, $Res Function(_$_EditSubField) then) =
      __$$_EditSubFieldCopyWithImpl<$Res>;
  @useResult
  $Res call({int fieldIndex, String subText});
}

/// @nodoc
class __$$_EditSubFieldCopyWithImpl<$Res>
    extends _$EditorEventCopyWithImpl<$Res, _$_EditSubField>
    implements _$$_EditSubFieldCopyWith<$Res> {
  __$$_EditSubFieldCopyWithImpl(
      _$_EditSubField _value, $Res Function(_$_EditSubField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fieldIndex = null,
    Object? subText = null,
  }) {
    return _then(_$_EditSubField(
      fieldIndex: null == fieldIndex
          ? _value.fieldIndex
          : fieldIndex // ignore: cast_nullable_to_non_nullable
              as int,
      subText: null == subText
          ? _value.subText
          : subText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EditSubField implements _EditSubField {
  const _$_EditSubField({required this.fieldIndex, required this.subText});

  @override
  final int fieldIndex;
  @override
  final String subText;

  @override
  String toString() {
    return 'EditorEvent.editSubField(fieldIndex: $fieldIndex, subText: $subText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditSubField &&
            (identical(other.fieldIndex, fieldIndex) ||
                other.fieldIndex == fieldIndex) &&
            (identical(other.subText, subText) || other.subText == subText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fieldIndex, subText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditSubFieldCopyWith<_$_EditSubField> get copyWith =>
      __$$_EditSubFieldCopyWithImpl<_$_EditSubField>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int fieldIndex, String text, List<int>? dependedFields)
        editField,
    required TResult Function(int fieldIndex, String subText) editSubField,
    required TResult Function() save,
  }) {
    return editSubField(fieldIndex, subText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int fieldIndex, String text, List<int>? dependedFields)?
        editField,
    TResult? Function(int fieldIndex, String subText)? editSubField,
    TResult? Function()? save,
  }) {
    return editSubField?.call(fieldIndex, subText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int fieldIndex, String text, List<int>? dependedFields)?
        editField,
    TResult Function(int fieldIndex, String subText)? editSubField,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (editSubField != null) {
      return editSubField(fieldIndex, subText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditField value) editField,
    required TResult Function(_EditSubField value) editSubField,
    required TResult Function(_Save value) save,
  }) {
    return editSubField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditField value)? editField,
    TResult? Function(_EditSubField value)? editSubField,
    TResult? Function(_Save value)? save,
  }) {
    return editSubField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditField value)? editField,
    TResult Function(_EditSubField value)? editSubField,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (editSubField != null) {
      return editSubField(this);
    }
    return orElse();
  }
}

abstract class _EditSubField implements EditorEvent {
  const factory _EditSubField(
      {required final int fieldIndex,
      required final String subText}) = _$_EditSubField;

  int get fieldIndex;
  String get subText;
  @JsonKey(ignore: true)
  _$$_EditSubFieldCopyWith<_$_EditSubField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SaveCopyWith<$Res> {
  factory _$$_SaveCopyWith(_$_Save value, $Res Function(_$_Save) then) =
      __$$_SaveCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SaveCopyWithImpl<$Res>
    extends _$EditorEventCopyWithImpl<$Res, _$_Save>
    implements _$$_SaveCopyWith<$Res> {
  __$$_SaveCopyWithImpl(_$_Save _value, $Res Function(_$_Save) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Save implements _Save {
  const _$_Save();

  @override
  String toString() {
    return 'EditorEvent.save()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Save);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            int fieldIndex, String text, List<int>? dependedFields)
        editField,
    required TResult Function(int fieldIndex, String subText) editSubField,
    required TResult Function() save,
  }) {
    return save();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int fieldIndex, String text, List<int>? dependedFields)?
        editField,
    TResult? Function(int fieldIndex, String subText)? editSubField,
    TResult? Function()? save,
  }) {
    return save?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int fieldIndex, String text, List<int>? dependedFields)?
        editField,
    TResult Function(int fieldIndex, String subText)? editSubField,
    TResult Function()? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditField value) editField,
    required TResult Function(_EditSubField value) editSubField,
    required TResult Function(_Save value) save,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditField value)? editField,
    TResult? Function(_EditSubField value)? editSubField,
    TResult? Function(_Save value)? save,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditField value)? editField,
    TResult Function(_EditSubField value)? editSubField,
    TResult Function(_Save value)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class _Save implements EditorEvent {
  const factory _Save() = _$_Save;
}

/// @nodoc
mixin _$EditorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() loading,
    required TResult Function(ActData act) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function()? loading,
    TResult? Function(ActData act)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? loading,
    TResult Function(ActData act)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorErrorState value) error,
    required TResult Function(EditorLoadingState value) loading,
    required TResult Function(EditorLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorErrorState value)? error,
    TResult? Function(EditorLoadingState value)? loading,
    TResult? Function(EditorLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorErrorState value)? error,
    TResult Function(EditorLoadingState value)? loading,
    TResult Function(EditorLoadedState value)? loaded,
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
abstract class _$$EditorErrorStateCopyWith<$Res> {
  factory _$$EditorErrorStateCopyWith(
          _$EditorErrorState value, $Res Function(_$EditorErrorState) then) =
      __$$EditorErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$EditorErrorStateCopyWithImpl<$Res>
    extends _$EditorStateCopyWithImpl<$Res, _$EditorErrorState>
    implements _$$EditorErrorStateCopyWith<$Res> {
  __$$EditorErrorStateCopyWithImpl(
      _$EditorErrorState _value, $Res Function(_$EditorErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$EditorErrorState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditorErrorState implements EditorErrorState {
  const _$EditorErrorState({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'EditorState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorErrorStateCopyWith<_$EditorErrorState> get copyWith =>
      __$$EditorErrorStateCopyWithImpl<_$EditorErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() loading,
    required TResult Function(ActData act) loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function()? loading,
    TResult? Function(ActData act)? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? loading,
    TResult Function(ActData act)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorErrorState value) error,
    required TResult Function(EditorLoadingState value) loading,
    required TResult Function(EditorLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorErrorState value)? error,
    TResult? Function(EditorLoadingState value)? loading,
    TResult? Function(EditorLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorErrorState value)? error,
    TResult Function(EditorLoadingState value)? loading,
    TResult Function(EditorLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class EditorErrorState implements EditorState {
  const factory EditorErrorState({required final String message}) =
      _$EditorErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$EditorErrorStateCopyWith<_$EditorErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditorLoadingStateCopyWith<$Res> {
  factory _$$EditorLoadingStateCopyWith(_$EditorLoadingState value,
          $Res Function(_$EditorLoadingState) then) =
      __$$EditorLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EditorLoadingStateCopyWithImpl<$Res>
    extends _$EditorStateCopyWithImpl<$Res, _$EditorLoadingState>
    implements _$$EditorLoadingStateCopyWith<$Res> {
  __$$EditorLoadingStateCopyWithImpl(
      _$EditorLoadingState _value, $Res Function(_$EditorLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EditorLoadingState implements EditorLoadingState {
  const _$EditorLoadingState();

  @override
  String toString() {
    return 'EditorState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EditorLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() loading,
    required TResult Function(ActData act) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function()? loading,
    TResult? Function(ActData act)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? loading,
    TResult Function(ActData act)? loaded,
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
    required TResult Function(EditorErrorState value) error,
    required TResult Function(EditorLoadingState value) loading,
    required TResult Function(EditorLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorErrorState value)? error,
    TResult? Function(EditorLoadingState value)? loading,
    TResult? Function(EditorLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorErrorState value)? error,
    TResult Function(EditorLoadingState value)? loading,
    TResult Function(EditorLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class EditorLoadingState implements EditorState {
  const factory EditorLoadingState() = _$EditorLoadingState;
}

/// @nodoc
abstract class _$$EditorLoadedStateCopyWith<$Res> {
  factory _$$EditorLoadedStateCopyWith(
          _$EditorLoadedState value, $Res Function(_$EditorLoadedState) then) =
      __$$EditorLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({ActData act});

  $ActDataCopyWith<$Res> get act;
}

/// @nodoc
class __$$EditorLoadedStateCopyWithImpl<$Res>
    extends _$EditorStateCopyWithImpl<$Res, _$EditorLoadedState>
    implements _$$EditorLoadedStateCopyWith<$Res> {
  __$$EditorLoadedStateCopyWithImpl(
      _$EditorLoadedState _value, $Res Function(_$EditorLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? act = null,
  }) {
    return _then(_$EditorLoadedState(
      act: null == act
          ? _value.act
          : act // ignore: cast_nullable_to_non_nullable
              as ActData,
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

class _$EditorLoadedState implements EditorLoadedState {
  const _$EditorLoadedState({required this.act});

  @override
  final ActData act;

  @override
  String toString() {
    return 'EditorState.loaded(act: $act)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditorLoadedState &&
            (identical(other.act, act) || other.act == act));
  }

  @override
  int get hashCode => Object.hash(runtimeType, act);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorLoadedStateCopyWith<_$EditorLoadedState> get copyWith =>
      __$$EditorLoadedStateCopyWithImpl<_$EditorLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function() loading,
    required TResult Function(ActData act) loaded,
  }) {
    return loaded(act);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function()? loading,
    TResult? Function(ActData act)? loaded,
  }) {
    return loaded?.call(act);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function()? loading,
    TResult Function(ActData act)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(act);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EditorErrorState value) error,
    required TResult Function(EditorLoadingState value) loading,
    required TResult Function(EditorLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EditorErrorState value)? error,
    TResult? Function(EditorLoadingState value)? loading,
    TResult? Function(EditorLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EditorErrorState value)? error,
    TResult Function(EditorLoadingState value)? loading,
    TResult Function(EditorLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class EditorLoadedState implements EditorState {
  const factory EditorLoadedState({required final ActData act}) =
      _$EditorLoadedState;

  ActData get act;
  @JsonKey(ignore: true)
  _$$EditorLoadedStateCopyWith<_$EditorLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}
