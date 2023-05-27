// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clouser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Clouser _$$_ClouserFromJson(Map<String, dynamic> json) => _$_Clouser(
      id: json['id'] as int,
      name: json['name'] as String,
      acts: (json['acts'] as List<dynamic>?)
              ?.map((e) => ActData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ActData>[],
      commonInfo: (json['commonInfo'] as List<dynamic>?)
              ?.map((e) => FieldsData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <FieldsData>[],
    );

Map<String, dynamic> _$$_ClouserToJson(_$_Clouser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'acts': instance.acts.map((e) => e.toJson()).toList(),
      'commonInfo': instance.commonInfo.map((e) => e.toJson()).toList(),
    };
