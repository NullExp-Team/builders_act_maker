// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'field_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FieldData _$FieldDataFromJson(Map<String, dynamic> json) {
  return _FieldData.fromJson(json);
}

/// @nodoc
mixin _$FieldData {
  String get text => throw _privateConstructorUsedError;
  bool get hasSpace => throw _privateConstructorUsedError;
  String? get subText => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FieldDataCopyWith<FieldData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FieldDataCopyWith<$Res> {
  factory $FieldDataCopyWith(FieldData value, $Res Function(FieldData) then) =
      _$FieldDataCopyWithImpl<$Res, FieldData>;
  @useResult
  $Res call({String text, bool hasSpace, String? subText});
}

/// @nodoc
class _$FieldDataCopyWithImpl<$Res, $Val extends FieldData>
    implements $FieldDataCopyWith<$Res> {
  _$FieldDataCopyWithImpl(this._value, this._then);

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
abstract class _$$_FieldDataCopyWith<$Res> implements $FieldDataCopyWith<$Res> {
  factory _$$_FieldDataCopyWith(
          _$_FieldData value, $Res Function(_$_FieldData) then) =
      __$$_FieldDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text, bool hasSpace, String? subText});
}

/// @nodoc
class __$$_FieldDataCopyWithImpl<$Res>
    extends _$FieldDataCopyWithImpl<$Res, _$_FieldData>
    implements _$$_FieldDataCopyWith<$Res> {
  __$$_FieldDataCopyWithImpl(
      _$_FieldData _value, $Res Function(_$_FieldData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
    Object? hasSpace = null,
    Object? subText = freezed,
  }) {
    return _then(_$_FieldData(
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
class _$_FieldData implements _FieldData {
  _$_FieldData(
      {required this.text, required this.hasSpace, required this.subText});

  factory _$_FieldData.fromJson(Map<String, dynamic> json) =>
      _$$_FieldDataFromJson(json);

  @override
  final String text;
  @override
  final bool hasSpace;
  @override
  final String? subText;

  @override
  String toString() {
    return 'FieldData(text: $text, hasSpace: $hasSpace, subText: $subText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FieldData &&
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
  _$$_FieldDataCopyWith<_$_FieldData> get copyWith =>
      __$$_FieldDataCopyWithImpl<_$_FieldData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FieldDataToJson(
      this,
    );
  }
}

abstract class _FieldData implements FieldData {
  factory _FieldData(
      {required final String text,
      required final bool hasSpace,
      required final String? subText}) = _$_FieldData;

  factory _FieldData.fromJson(Map<String, dynamic> json) =
      _$_FieldData.fromJson;

  @override
  String get text;
  @override
  bool get hasSpace;
  @override
  String? get subText;
  @override
  @JsonKey(ignore: true)
  _$$_FieldDataCopyWith<_$_FieldData> get copyWith =>
      throw _privateConstructorUsedError;
}
