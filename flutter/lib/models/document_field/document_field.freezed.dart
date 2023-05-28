// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DocumentField _$DocumentFieldFromJson(Map<String, dynamic> json) {
  return _DocumentField.fromJson(json);
}

/// @nodoc
mixin _$DocumentField {
  String get key => throw _privateConstructorUsedError;
  List<DocumentField> get preFields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DocumentFieldCopyWith<DocumentField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DocumentFieldCopyWith<$Res> {
  factory $DocumentFieldCopyWith(
          DocumentField value, $Res Function(DocumentField) then) =
      _$DocumentFieldCopyWithImpl<$Res, DocumentField>;
  @useResult
  $Res call({String key, List<DocumentField> preFields});
}

/// @nodoc
class _$DocumentFieldCopyWithImpl<$Res, $Val extends DocumentField>
    implements $DocumentFieldCopyWith<$Res> {
  _$DocumentFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? preFields = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      preFields: null == preFields
          ? _value.preFields
          : preFields // ignore: cast_nullable_to_non_nullable
              as List<DocumentField>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DocumentFieldCopyWith<$Res>
    implements $DocumentFieldCopyWith<$Res> {
  factory _$$_DocumentFieldCopyWith(
          _$_DocumentField value, $Res Function(_$_DocumentField) then) =
      __$$_DocumentFieldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, List<DocumentField> preFields});
}

/// @nodoc
class __$$_DocumentFieldCopyWithImpl<$Res>
    extends _$DocumentFieldCopyWithImpl<$Res, _$_DocumentField>
    implements _$$_DocumentFieldCopyWith<$Res> {
  __$$_DocumentFieldCopyWithImpl(
      _$_DocumentField _value, $Res Function(_$_DocumentField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? preFields = null,
  }) {
    return _then(_$_DocumentField(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      preFields: null == preFields
          ? _value._preFields
          : preFields // ignore: cast_nullable_to_non_nullable
              as List<DocumentField>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DocumentField implements _DocumentField {
  _$_DocumentField(
      {required this.key, required final List<DocumentField> preFields})
      : _preFields = preFields;

  factory _$_DocumentField.fromJson(Map<String, dynamic> json) =>
      _$$_DocumentFieldFromJson(json);

  @override
  final String key;
  final List<DocumentField> _preFields;
  @override
  List<DocumentField> get preFields {
    if (_preFields is EqualUnmodifiableListView) return _preFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preFields);
  }

  @override
  String toString() {
    return 'DocumentField(key: $key, preFields: $preFields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DocumentField &&
            (identical(other.key, key) || other.key == key) &&
            const DeepCollectionEquality()
                .equals(other._preFields, _preFields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, key, const DeepCollectionEquality().hash(_preFields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DocumentFieldCopyWith<_$_DocumentField> get copyWith =>
      __$$_DocumentFieldCopyWithImpl<_$_DocumentField>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DocumentFieldToJson(
      this,
    );
  }
}

abstract class _DocumentField implements DocumentField {
  factory _DocumentField(
      {required final String key,
      required final List<DocumentField> preFields}) = _$_DocumentField;

  factory _DocumentField.fromJson(Map<String, dynamic> json) =
      _$_DocumentField.fromJson;

  @override
  String get key;
  @override
  List<DocumentField> get preFields;
  @override
  @JsonKey(ignore: true)
  _$$_DocumentFieldCopyWith<_$_DocumentField> get copyWith =>
      throw _privateConstructorUsedError;
}
