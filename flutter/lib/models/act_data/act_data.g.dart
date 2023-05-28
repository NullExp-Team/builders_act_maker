// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'act_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActData _$$_ActDataFromJson(Map<String, dynamic> json) => _$_ActData(
      name: json['name'] as String,
      type: $enumDecode(_$DocumentTypeEnumMap, json['type']),
      fields: (json['fields'] as List<dynamic>?)
              ?.map((e) => FieldData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ActDataToJson(_$_ActData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': _$DocumentTypeEnumMap[instance.type]!,
      'fields': instance.fields.map((e) => e.toJson()).toList(),
    };

const _$DocumentTypeEnumMap = {
  DocumentType.actOSR: 'actOSR',
  DocumentType.clouseAct: 'clouseAct',
};
