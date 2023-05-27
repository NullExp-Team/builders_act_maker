// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'act_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActData _$$_ActDataFromJson(Map<String, dynamic> json) => _$_ActData(
      name: json['name'] as String,
      type: fromJson(json['type'] as String),
      fields: (json['fields'] as List<dynamic>?)
              ?.map((e) => FieldsData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ActDataToJson(_$_ActData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type.toJson(),
      'fields': instance.fields.map((e) => e.toJson()).toList(),
    };
