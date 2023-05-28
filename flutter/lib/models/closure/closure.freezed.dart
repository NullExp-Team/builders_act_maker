// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'closure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Closure _$ClosureFromJson(Map<String, dynamic> json) {
  return _Closure.fromJson(json);
}

/// @nodoc
mixin _$Closure {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<ActData> get acts => throw _privateConstructorUsedError;
  List<FieldData> get commonInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClosureCopyWith<Closure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClosureCopyWith<$Res> {
  factory $ClosureCopyWith(Closure value, $Res Function(Closure) then) =
      _$ClosureCopyWithImpl<$Res, Closure>;
  @useResult
  $Res call(
      {int id, String name, List<ActData> acts, List<FieldData> commonInfo});
}

/// @nodoc
class _$ClosureCopyWithImpl<$Res, $Val extends Closure>
    implements $ClosureCopyWith<$Res> {
  _$ClosureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? acts = null,
    Object? commonInfo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      acts: null == acts
          ? _value.acts
          : acts // ignore: cast_nullable_to_non_nullable
              as List<ActData>,
      commonInfo: null == commonInfo
          ? _value.commonInfo
          : commonInfo // ignore: cast_nullable_to_non_nullable
              as List<FieldData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClosureCopyWith<$Res> implements $ClosureCopyWith<$Res> {
  factory _$$_ClosureCopyWith(
          _$_Closure value, $Res Function(_$_Closure) then) =
      __$$_ClosureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, List<ActData> acts, List<FieldData> commonInfo});
}

/// @nodoc
class __$$_ClosureCopyWithImpl<$Res>
    extends _$ClosureCopyWithImpl<$Res, _$_Closure>
    implements _$$_ClosureCopyWith<$Res> {
  __$$_ClosureCopyWithImpl(_$_Closure _value, $Res Function(_$_Closure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? acts = null,
    Object? commonInfo = null,
  }) {
    return _then(_$_Closure(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      acts: null == acts
          ? _value._acts
          : acts // ignore: cast_nullable_to_non_nullable
              as List<ActData>,
      commonInfo: null == commonInfo
          ? _value._commonInfo
          : commonInfo // ignore: cast_nullable_to_non_nullable
              as List<FieldData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Closure implements _Closure {
  _$_Closure(
      {required this.id,
      required this.name,
      final List<ActData> acts = const <ActData>[],
      final List<FieldData> commonInfo = const <FieldData>[]})
      : _acts = acts,
        _commonInfo = commonInfo;

  factory _$_Closure.fromJson(Map<String, dynamic> json) =>
      _$$_ClosureFromJson(json);

  @override
  final int id;
  @override
  final String name;
  final List<ActData> _acts;
  @override
  @JsonKey()
  List<ActData> get acts {
    if (_acts is EqualUnmodifiableListView) return _acts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_acts);
  }

  final List<FieldData> _commonInfo;
  @override
  @JsonKey()
  List<FieldData> get commonInfo {
    if (_commonInfo is EqualUnmodifiableListView) return _commonInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_commonInfo);
  }

  @override
  String toString() {
    return 'Closure(id: $id, name: $name, acts: $acts, commonInfo: $commonInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Closure &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._acts, _acts) &&
            const DeepCollectionEquality()
                .equals(other._commonInfo, _commonInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_acts),
      const DeepCollectionEquality().hash(_commonInfo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClosureCopyWith<_$_Closure> get copyWith =>
      __$$_ClosureCopyWithImpl<_$_Closure>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClosureToJson(
      this,
    );
  }
}

abstract class _Closure implements Closure {
  factory _Closure(
      {required final int id,
      required final String name,
      final List<ActData> acts,
      final List<FieldData> commonInfo}) = _$_Closure;

  factory _Closure.fromJson(Map<String, dynamic> json) = _$_Closure.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  List<ActData> get acts;
  @override
  List<FieldData> get commonInfo;
  @override
  @JsonKey(ignore: true)
  _$$_ClosureCopyWith<_$_Closure> get copyWith =>
      throw _privateConstructorUsedError;
}
