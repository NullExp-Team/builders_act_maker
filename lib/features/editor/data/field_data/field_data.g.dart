// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FieldDataAdapter extends TypeAdapter<_$_FieldData> {
  @override
  final int typeId = 2;

  @override
  _$_FieldData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_FieldData(
      text: fields[0] as String,
      hasSpace: fields[1] as bool,
      subText: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_FieldData obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.hasSpace)
      ..writeByte(2)
      ..write(obj.subText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FieldDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FieldData _$$_FieldDataFromJson(Map<String, dynamic> json) => _$_FieldData(
      text: json['text'] as String,
      hasSpace: json['hasSpace'] as bool,
      subText: json['subText'] as String?,
    );

Map<String, dynamic> _$$_FieldDataToJson(_$_FieldData instance) =>
    <String, dynamic>{
      'text': instance.text,
      'hasSpace': instance.hasSpace,
      'subText': instance.subText,
    };
