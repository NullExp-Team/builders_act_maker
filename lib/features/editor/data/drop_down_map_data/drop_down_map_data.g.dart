// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_down_map_data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DropDownMapDataAdapter extends TypeAdapter<_$_DropDownMapData> {
  @override
  final int typeId = 4;

  @override
  _$_DropDownMapData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_DropDownMapData(
      dropDownValuesMap: (fields[0] as List).cast<String>(),
      dependedFieldMapsMap: (fields[1] as Map).cast<String, String>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_DropDownMapData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.dropDownValuesMap)
      ..writeByte(1)
      ..write(obj.dependedFieldMapsMap);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DropDownMapDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
