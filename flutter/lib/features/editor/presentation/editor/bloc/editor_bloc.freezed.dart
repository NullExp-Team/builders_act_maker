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
    required TResult Function(int fieldIndex, String text,
            List<int>? dependedFields, String? textForDependedFields)
        editField,
    required TResult Function(int fieldIndex, String subText) editSubField,
    required TResult Function(int? index) save,
    required TResult Function(int closureId, int actId) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int fieldIndex, String text, List<int>? dependedFields,
            String? textForDependedFields)?
        editField,
    TResult? Function(int fieldIndex, String subText)? editSubField,
    TResult? Function(int? index)? save,
    TResult? Function(int closureId, int actId)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int fieldIndex, String text, List<int>? dependedFields,
            String? textForDependedFields)?
        editField,
    TResult Function(int fieldIndex, String subText)? editSubField,
    TResult Function(int? index)? save,
    TResult Function(int closureId, int actId)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditField value) editField,
    required TResult Function(_EditSubField value) editSubField,
    required TResult Function(_Save value) save,
    required TResult Function(_Init value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditField value)? editField,
    TResult? Function(_EditSubField value)? editSubField,
    TResult? Function(_Save value)? save,
    TResult? Function(_Init value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditField value)? editField,
    TResult Function(_EditSubField value)? editSubField,
    TResult Function(_Save value)? save,
    TResult Function(_Init value)? init,
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
  $Res call(
      {int fieldIndex,
      String text,
      List<int>? dependedFields,
      String? textForDependedFields});
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
    Object? textForDependedFields = freezed,
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
      textForDependedFields: freezed == textForDependedFields
          ? _value.textForDependedFields
          : textForDependedFields // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_EditField implements _EditField {
  const _$_EditField(
      {required this.fieldIndex,
      required this.text,
      final List<int>? dependedFields,
      this.textForDependedFields})
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
  final String? textForDependedFields;

  @override
  String toString() {
    return 'EditorEvent.editField(fieldIndex: $fieldIndex, text: $text, dependedFields: $dependedFields, textForDependedFields: $textForDependedFields)';
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
                .equals(other._dependedFields, _dependedFields) &&
            (identical(other.textForDependedFields, textForDependedFields) ||
                other.textForDependedFields == textForDependedFields));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      fieldIndex,
      text,
      const DeepCollectionEquality().hash(_dependedFields),
      textForDependedFields);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditFieldCopyWith<_$_EditField> get copyWith =>
      __$$_EditFieldCopyWithImpl<_$_EditField>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int fieldIndex, String text,
            List<int>? dependedFields, String? textForDependedFields)
        editField,
    required TResult Function(int fieldIndex, String subText) editSubField,
    required TResult Function(int? index) save,
    required TResult Function(int closureId, int actId) init,
  }) {
    return editField(fieldIndex, text, dependedFields, textForDependedFields);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int fieldIndex, String text, List<int>? dependedFields,
            String? textForDependedFields)?
        editField,
    TResult? Function(int fieldIndex, String subText)? editSubField,
    TResult? Function(int? index)? save,
    TResult? Function(int closureId, int actId)? init,
  }) {
    return editField?.call(
        fieldIndex, text, dependedFields, textForDependedFields);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int fieldIndex, String text, List<int>? dependedFields,
            String? textForDependedFields)?
        editField,
    TResult Function(int fieldIndex, String subText)? editSubField,
    TResult Function(int? index)? save,
    TResult Function(int closureId, int actId)? init,
    required TResult orElse(),
  }) {
    if (editField != null) {
      return editField(fieldIndex, text, dependedFields, textForDependedFields);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditField value) editField,
    required TResult Function(_EditSubField value) editSubField,
    required TResult Function(_Save value) save,
    required TResult Function(_Init value) init,
  }) {
    return editField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditField value)? editField,
    TResult? Function(_EditSubField value)? editSubField,
    TResult? Function(_Save value)? save,
    TResult? Function(_Init value)? init,
  }) {
    return editField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditField value)? editField,
    TResult Function(_EditSubField value)? editSubField,
    TResult Function(_Save value)? save,
    TResult Function(_Init value)? init,
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
      final List<int>? dependedFields,
      final String? textForDependedFields}) = _$_EditField;

  int get fieldIndex;
  String get text;
  List<int>? get dependedFields;
  String? get textForDependedFields;
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
    required TResult Function(int fieldIndex, String text,
            List<int>? dependedFields, String? textForDependedFields)
        editField,
    required TResult Function(int fieldIndex, String subText) editSubField,
    required TResult Function(int? index) save,
    required TResult Function(int closureId, int actId) init,
  }) {
    return editSubField(fieldIndex, subText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int fieldIndex, String text, List<int>? dependedFields,
            String? textForDependedFields)?
        editField,
    TResult? Function(int fieldIndex, String subText)? editSubField,
    TResult? Function(int? index)? save,
    TResult? Function(int closureId, int actId)? init,
  }) {
    return editSubField?.call(fieldIndex, subText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int fieldIndex, String text, List<int>? dependedFields,
            String? textForDependedFields)?
        editField,
    TResult Function(int fieldIndex, String subText)? editSubField,
    TResult Function(int? index)? save,
    TResult Function(int closureId, int actId)? init,
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
    required TResult Function(_Init value) init,
  }) {
    return editSubField(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditField value)? editField,
    TResult? Function(_EditSubField value)? editSubField,
    TResult? Function(_Save value)? save,
    TResult? Function(_Init value)? init,
  }) {
    return editSubField?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditField value)? editField,
    TResult Function(_EditSubField value)? editSubField,
    TResult Function(_Save value)? save,
    TResult Function(_Init value)? init,
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
  @useResult
  $Res call({int? index});
}

/// @nodoc
class __$$_SaveCopyWithImpl<$Res>
    extends _$EditorEventCopyWithImpl<$Res, _$_Save>
    implements _$$_SaveCopyWith<$Res> {
  __$$_SaveCopyWithImpl(_$_Save _value, $Res Function(_$_Save) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_$_Save(
      freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_Save implements _Save {
  const _$_Save(this.index);

  @override
  final int? index;

  @override
  String toString() {
    return 'EditorEvent.save(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Save &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaveCopyWith<_$_Save> get copyWith =>
      __$$_SaveCopyWithImpl<_$_Save>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int fieldIndex, String text,
            List<int>? dependedFields, String? textForDependedFields)
        editField,
    required TResult Function(int fieldIndex, String subText) editSubField,
    required TResult Function(int? index) save,
    required TResult Function(int closureId, int actId) init,
  }) {
    return save(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int fieldIndex, String text, List<int>? dependedFields,
            String? textForDependedFields)?
        editField,
    TResult? Function(int fieldIndex, String subText)? editSubField,
    TResult? Function(int? index)? save,
    TResult? Function(int closureId, int actId)? init,
  }) {
    return save?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int fieldIndex, String text, List<int>? dependedFields,
            String? textForDependedFields)?
        editField,
    TResult Function(int fieldIndex, String subText)? editSubField,
    TResult Function(int? index)? save,
    TResult Function(int closureId, int actId)? init,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditField value) editField,
    required TResult Function(_EditSubField value) editSubField,
    required TResult Function(_Save value) save,
    required TResult Function(_Init value) init,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditField value)? editField,
    TResult? Function(_EditSubField value)? editSubField,
    TResult? Function(_Save value)? save,
    TResult? Function(_Init value)? init,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditField value)? editField,
    TResult Function(_EditSubField value)? editSubField,
    TResult Function(_Save value)? save,
    TResult Function(_Init value)? init,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class _Save implements EditorEvent {
  const factory _Save(final int? index) = _$_Save;

  int? get index;
  @JsonKey(ignore: true)
  _$$_SaveCopyWith<_$_Save> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InitCopyWith<$Res> {
  factory _$$_InitCopyWith(_$_Init value, $Res Function(_$_Init) then) =
      __$$_InitCopyWithImpl<$Res>;
  @useResult
  $Res call({int closureId, int actId});
}

/// @nodoc
class __$$_InitCopyWithImpl<$Res>
    extends _$EditorEventCopyWithImpl<$Res, _$_Init>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? closureId = null,
    Object? actId = null,
  }) {
    return _then(_$_Init(
      null == closureId
          ? _value.closureId
          : closureId // ignore: cast_nullable_to_non_nullable
              as int,
      null == actId
          ? _value.actId
          : actId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init(this.closureId, this.actId);

  @override
  final int closureId;
  @override
  final int actId;

  @override
  String toString() {
    return 'EditorEvent.init(closureId: $closureId, actId: $actId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Init &&
            (identical(other.closureId, closureId) ||
                other.closureId == closureId) &&
            (identical(other.actId, actId) || other.actId == actId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, closureId, actId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitCopyWith<_$_Init> get copyWith =>
      __$$_InitCopyWithImpl<_$_Init>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int fieldIndex, String text,
            List<int>? dependedFields, String? textForDependedFields)
        editField,
    required TResult Function(int fieldIndex, String subText) editSubField,
    required TResult Function(int? index) save,
    required TResult Function(int closureId, int actId) init,
  }) {
    return init(closureId, actId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int fieldIndex, String text, List<int>? dependedFields,
            String? textForDependedFields)?
        editField,
    TResult? Function(int fieldIndex, String subText)? editSubField,
    TResult? Function(int? index)? save,
    TResult? Function(int closureId, int actId)? init,
  }) {
    return init?.call(closureId, actId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int fieldIndex, String text, List<int>? dependedFields,
            String? textForDependedFields)?
        editField,
    TResult Function(int fieldIndex, String subText)? editSubField,
    TResult Function(int? index)? save,
    TResult Function(int closureId, int actId)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(closureId, actId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EditField value) editField,
    required TResult Function(_EditSubField value) editSubField,
    required TResult Function(_Save value) save,
    required TResult Function(_Init value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EditField value)? editField,
    TResult? Function(_EditSubField value)? editSubField,
    TResult? Function(_Save value)? save,
    TResult? Function(_Init value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EditField value)? editField,
    TResult Function(_EditSubField value)? editSubField,
    TResult Function(_Save value)? save,
    TResult Function(_Init value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements EditorEvent {
  const factory _Init(final int closureId, final int actId) = _$_Init;

  int get closureId;
  int get actId;
  @JsonKey(ignore: true)
  _$$_InitCopyWith<_$_Init> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EditorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ActData act) loaded,
    required TResult Function() init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ActData act)? loaded,
    TResult? Function()? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ActData act)? loaded,
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
  $Res call({ActData act});

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
  }) {
    return _then(_$EditorStateLoaded(
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

class _$EditorStateLoaded implements EditorStateLoaded {
  const _$EditorStateLoaded({required this.act});

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
            other is _$EditorStateLoaded &&
            (identical(other.act, act) || other.act == act));
  }

  @override
  int get hashCode => Object.hash(runtimeType, act);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditorStateLoadedCopyWith<_$EditorStateLoaded> get copyWith =>
      __$$EditorStateLoadedCopyWithImpl<_$EditorStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ActData act) loaded,
    required TResult Function() init,
  }) {
    return loaded(act);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ActData act)? loaded,
    TResult? Function()? init,
  }) {
    return loaded?.call(act);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ActData act)? loaded,
    TResult Function()? init,
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
  const factory EditorStateLoaded({required final ActData act}) =
      _$EditorStateLoaded;

  ActData get act;
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
    required TResult Function(ActData act) loaded,
    required TResult Function() init,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ActData act)? loaded,
    TResult? Function()? init,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ActData act)? loaded,
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
