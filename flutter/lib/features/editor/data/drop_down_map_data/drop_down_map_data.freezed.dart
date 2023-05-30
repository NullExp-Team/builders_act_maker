// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drop_down_map_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DropDownMapData {
  @HiveField(0)
  List<String> get dropDownValuesMap => throw _privateConstructorUsedError;
  @HiveField(1)
  Map<String, String> get dependedFieldMapsMap =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DropDownMapDataCopyWith<DropDownMapData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DropDownMapDataCopyWith<$Res> {
  factory $DropDownMapDataCopyWith(
          DropDownMapData value, $Res Function(DropDownMapData) then) =
      _$DropDownMapDataCopyWithImpl<$Res, DropDownMapData>;
  @useResult
  $Res call(
      {@HiveField(0) List<String> dropDownValuesMap,
      @HiveField(1) Map<String, String> dependedFieldMapsMap});
}

/// @nodoc
class _$DropDownMapDataCopyWithImpl<$Res, $Val extends DropDownMapData>
    implements $DropDownMapDataCopyWith<$Res> {
  _$DropDownMapDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dropDownValuesMap = null,
    Object? dependedFieldMapsMap = null,
  }) {
    return _then(_value.copyWith(
      dropDownValuesMap: null == dropDownValuesMap
          ? _value.dropDownValuesMap
          : dropDownValuesMap // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dependedFieldMapsMap: null == dependedFieldMapsMap
          ? _value.dependedFieldMapsMap
          : dependedFieldMapsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DropDownMapDataCopyWith<$Res>
    implements $DropDownMapDataCopyWith<$Res> {
  factory _$$_DropDownMapDataCopyWith(
          _$_DropDownMapData value, $Res Function(_$_DropDownMapData) then) =
      __$$_DropDownMapDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) List<String> dropDownValuesMap,
      @HiveField(1) Map<String, String> dependedFieldMapsMap});
}

/// @nodoc
class __$$_DropDownMapDataCopyWithImpl<$Res>
    extends _$DropDownMapDataCopyWithImpl<$Res, _$_DropDownMapData>
    implements _$$_DropDownMapDataCopyWith<$Res> {
  __$$_DropDownMapDataCopyWithImpl(
      _$_DropDownMapData _value, $Res Function(_$_DropDownMapData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dropDownValuesMap = null,
    Object? dependedFieldMapsMap = null,
  }) {
    return _then(_$_DropDownMapData(
      dropDownValuesMap: null == dropDownValuesMap
          ? _value._dropDownValuesMap
          : dropDownValuesMap // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dependedFieldMapsMap: null == dependedFieldMapsMap
          ? _value._dependedFieldMapsMap
          : dependedFieldMapsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 4)
class _$_DropDownMapData implements _DropDownMapData {
  const _$_DropDownMapData(
      {@HiveField(0) final List<String> dropDownValuesMap = const [],
      @HiveField(1) final Map<String, String> dependedFieldMapsMap = const {}})
      : _dropDownValuesMap = dropDownValuesMap,
        _dependedFieldMapsMap = dependedFieldMapsMap;

  final List<String> _dropDownValuesMap;
  @override
  @JsonKey()
  @HiveField(0)
  List<String> get dropDownValuesMap {
    if (_dropDownValuesMap is EqualUnmodifiableListView)
      return _dropDownValuesMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dropDownValuesMap);
  }

  final Map<String, String> _dependedFieldMapsMap;
  @override
  @JsonKey()
  @HiveField(1)
  Map<String, String> get dependedFieldMapsMap {
    if (_dependedFieldMapsMap is EqualUnmodifiableMapView)
      return _dependedFieldMapsMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dependedFieldMapsMap);
  }

  @override
  String toString() {
    return 'DropDownMapData(dropDownValuesMap: $dropDownValuesMap, dependedFieldMapsMap: $dependedFieldMapsMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DropDownMapData &&
            const DeepCollectionEquality()
                .equals(other._dropDownValuesMap, _dropDownValuesMap) &&
            const DeepCollectionEquality()
                .equals(other._dependedFieldMapsMap, _dependedFieldMapsMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_dropDownValuesMap),
      const DeepCollectionEquality().hash(_dependedFieldMapsMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DropDownMapDataCopyWith<_$_DropDownMapData> get copyWith =>
      __$$_DropDownMapDataCopyWithImpl<_$_DropDownMapData>(this, _$identity);
}

abstract class _DropDownMapData implements DropDownMapData {
  const factory _DropDownMapData(
          {@HiveField(0) final List<String> dropDownValuesMap,
          @HiveField(1) final Map<String, String> dependedFieldMapsMap}) =
      _$_DropDownMapData;

  @override
  @HiveField(0)
  List<String> get dropDownValuesMap;
  @override
  @HiveField(1)
  Map<String, String> get dependedFieldMapsMap;
  @override
  @JsonKey(ignore: true)
  _$$_DropDownMapDataCopyWith<_$_DropDownMapData> get copyWith =>
      throw _privateConstructorUsedError;
}
