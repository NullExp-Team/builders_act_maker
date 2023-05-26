// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fields_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FieldsData _$FieldsDataFromJson(Map<String, dynamic> json) {
  return _FieldsData.fromJson(json);
}

/// @nodoc
mixin _$FieldsData {
  String get text => throw _privateConstructorUsedError;
  bool get hasSpace => throw _privateConstructorUsedError;
  String? get subText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldsDataCopyWith<FieldsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldsDataCopyWith<$Res> {
  factory $FieldsDataCopyWith(
          FieldsData value, $Res Function(FieldsData) then) =
      _$FieldsDataCopyWithImpl<$Res, FieldsData>;
  @useResult
  $Res call({String text, bool hasSpace, String? subText});
}

/// @nodoc
class _$FieldsDataCopyWithImpl<$Res, $Val extends FieldsData>
    implements $FieldsDataCopyWith<$Res> {
  _$FieldsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? hasSpace = null,
    Object? subText = freezed,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      hasSpace: null == hasSpace
          ? _value.hasSpace
          : hasSpace // ignore: cast_nullable_to_non_nullable
              as bool,
      subText: freezed == subText
          ? _value.subText
          : subText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FieldsDataCopyWith<$Res>
    implements $FieldsDataCopyWith<$Res> {
  factory _$$_FieldsDataCopyWith(
          _$_FieldsData value, $Res Function(_$_FieldsData) then) =
      __$$_FieldsDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, bool hasSpace, String? subText});
}

/// @nodoc
class __$$_FieldsDataCopyWithImpl<$Res>
    extends _$FieldsDataCopyWithImpl<$Res, _$_FieldsData>
    implements _$$_FieldsDataCopyWith<$Res> {
  __$$_FieldsDataCopyWithImpl(
      _$_FieldsData _value, $Res Function(_$_FieldsData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? hasSpace = null,
    Object? subText = freezed,
  }) {
    return _then(_$_FieldsData(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      hasSpace: null == hasSpace
          ? _value.hasSpace
          : hasSpace // ignore: cast_nullable_to_non_nullable
              as bool,
      subText: freezed == subText
          ? _value.subText
          : subText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FieldsData implements _FieldsData {
  _$_FieldsData(
      {required this.text, required this.hasSpace, required this.subText});

  factory _$_FieldsData.fromJson(Map<String, dynamic> json) =>
      _$$_FieldsDataFromJson(json);

  @override
  final String text;
  @override
  final bool hasSpace;
  @override
  final String? subText;

  @override
  String toString() {
    return 'FieldsData(text: $text, hasSpace: $hasSpace, subText: $subText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FieldsData &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.hasSpace, hasSpace) ||
                other.hasSpace == hasSpace) &&
            (identical(other.subText, subText) || other.subText == subText));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, hasSpace, subText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FieldsDataCopyWith<_$_FieldsData> get copyWith =>
      __$$_FieldsDataCopyWithImpl<_$_FieldsData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FieldsDataToJson(
      this,
    );
  }
}

abstract class _FieldsData implements FieldsData {
  factory _FieldsData(
      {required final String text,
      required final bool hasSpace,
      required final String? subText}) = _$_FieldsData;

  factory _FieldsData.fromJson(Map<String, dynamic> json) =
      _$_FieldsData.fromJson;

  @override
  String get text;
  @override
  bool get hasSpace;
  @override
  String? get subText;
  @override
  @JsonKey(ignore: true)
  _$$_FieldsDataCopyWith<_$_FieldsData> get copyWith =>
      throw _privateConstructorUsedError;
}
