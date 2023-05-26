// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'act_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActData _$ActDataFromJson(Map<String, dynamic> json) {
  return _ActData.fromJson(json);
}

/// @nodoc
mixin _$ActData {
  String get name => throw _privateConstructorUsedError;
  @JsonKey(toJson: toJson, fromJson: fromJson)
  DocumentType get type => throw _privateConstructorUsedError;
  List<FieldsData> get fields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActDataCopyWith<ActData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActDataCopyWith<$Res> {
  factory $ActDataCopyWith(ActData value, $Res Function(ActData) then) =
      _$ActDataCopyWithImpl<$Res, ActData>;
  @useResult
  $Res call(
      {String name,
      @JsonKey(toJson: toJson, fromJson: fromJson) DocumentType type,
      List<FieldsData> fields});
}

/// @nodoc
class _$ActDataCopyWithImpl<$Res, $Val extends ActData>
    implements $ActDataCopyWith<$Res> {
  _$ActDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? fields = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<FieldsData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ActDataCopyWith<$Res> implements $ActDataCopyWith<$Res> {
  factory _$$_ActDataCopyWith(
          _$_ActData value, $Res Function(_$_ActData) then) =
      __$$_ActDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      @JsonKey(toJson: toJson, fromJson: fromJson) DocumentType type,
      List<FieldsData> fields});
}

/// @nodoc
class __$$_ActDataCopyWithImpl<$Res>
    extends _$ActDataCopyWithImpl<$Res, _$_ActData>
    implements _$$_ActDataCopyWith<$Res> {
  __$$_ActDataCopyWithImpl(_$_ActData _value, $Res Function(_$_ActData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? fields = null,
  }) {
    return _then(_$_ActData(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DocumentType,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<FieldsData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ActData implements _ActData {
  _$_ActData(
      {required this.name,
      @JsonKey(toJson: toJson, fromJson: fromJson) required this.type,
      final List<FieldsData> fields = const []})
      : _fields = fields;

  factory _$_ActData.fromJson(Map<String, dynamic> json) =>
      _$$_ActDataFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(toJson: toJson, fromJson: fromJson)
  final DocumentType type;
  final List<FieldsData> _fields;
  @override
  @JsonKey()
  List<FieldsData> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  String toString() {
    return 'ActData(name: $name, type: $type, fields: $fields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ActData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, type, const DeepCollectionEquality().hash(_fields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActDataCopyWith<_$_ActData> get copyWith =>
      __$$_ActDataCopyWithImpl<_$_ActData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ActDataToJson(
      this,
    );
  }
}

abstract class _ActData implements ActData {
  factory _ActData(
      {required final String name,
      @JsonKey(toJson: toJson, fromJson: fromJson)
          required final DocumentType type,
      final List<FieldsData> fields}) = _$_ActData;

  factory _ActData.fromJson(Map<String, dynamic> json) = _$_ActData.fromJson;

  @override
  String get name;
  @override
  @JsonKey(toJson: toJson, fromJson: fromJson)
  DocumentType get type;
  @override
  List<FieldsData> get fields;
  @override
  @JsonKey(ignore: true)
  _$$_ActDataCopyWith<_$_ActData> get copyWith =>
      throw _privateConstructorUsedError;
}
