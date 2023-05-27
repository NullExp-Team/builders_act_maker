// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Closure _$$_ClosureFromJson(Map<String, dynamic> json) => _$_Closure(
      id: json['id'] as int,
      name: json['name'] as String,
      acts: (json['acts'] as List<dynamic>?)
              ?.map((e) => ActData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ActData>[],
      commonInfo: (json['commonInfo'] as List<dynamic>?)
              ?.map((e) => FieldData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <FieldData>[],
    );

Map<String, dynamic> _$$_ClosureToJson(_$_Closure instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'acts': instance.acts.map((e) => e.toJson()).toList(),
      'commonInfo': instance.commonInfo.map((e) => e.toJson()).toList(),
    };
