// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DocumentField _$$_DocumentFieldFromJson(Map<String, dynamic> json) =>
    _$_DocumentField(
      key: json['key'] as String,
      preFields: (json['preFields'] as List<dynamic>)
          .map((e) => DocumentField.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_DocumentFieldToJson(_$_DocumentField instance) =>
    <String, dynamic>{
      'key': instance.key,
      'preFields': instance.preFields.map((e) => e.toJson()).toList(),
    };
