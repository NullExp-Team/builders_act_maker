// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closure.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ClosureAdapter extends TypeAdapter<_$_Closure> {
  @override
  final int typeId = 0;

  @override
  _$_Closure read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Closure(
      id: fields[0] as int,
      name: fields[1] as String,
      path: fields[2] as String,
      acts: (fields[3] as List).cast<ActData>(),
      commonInfo: fields[4] as ActData,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Closure obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.path)
      ..writeByte(4)
      ..write(obj.commonInfo)
      ..writeByte(3)
      ..write(obj.acts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClosureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Closure _$$_ClosureFromJson(Map<String, dynamic> json) => _$_Closure(
      id: json['id'] as int,
      name: json['name'] as String,
      path: json['path'] as String,
      acts: (json['acts'] as List<dynamic>?)
              ?.map((e) => ActData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ActData>[],
      commonInfo: ActData.fromJson(json['commonInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ClosureToJson(_$_Closure instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'acts': instance.acts.map((e) => e.toJson()).toList(),
      'commonInfo': instance.commonInfo.toJson(),
    };
