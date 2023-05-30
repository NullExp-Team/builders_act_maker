// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'act_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActDataAdapter extends TypeAdapter<_$_ActData> {
  @override
  final int typeId = 1;

  @override
  _$_ActData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_ActData(
      id: fields[0] as int,
      name: fields[1] as String,
      type: fields[2] as DocumentType,
      fields: (fields[3] as List).cast<FieldData>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_ActData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.fields);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActData _$$_ActDataFromJson(Map<String, dynamic> json) => _$_ActData(
      id: json['id'] as int,
      name: json['name'] as String,
      type: $enumDecode(_$DocumentTypeEnumMap, json['type']),
      fields: (json['fields'] as List<dynamic>?)
              ?.map((e) => FieldData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ActDataToJson(_$_ActData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$DocumentTypeEnumMap[instance.type]!,
      'fields': instance.fields.map((e) => e.toJson()).toList(),
    };

const _$DocumentTypeEnumMap = {
  DocumentType.actOSR: 'actOSR',
  DocumentType.clouseAct: 'clouseAct',
  DocumentType.commonInfo: 'commonInfo',
};
