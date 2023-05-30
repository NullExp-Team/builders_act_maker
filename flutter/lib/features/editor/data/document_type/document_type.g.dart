// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DocumentTypeAdapter extends TypeAdapter<DocumentType> {
  @override
  final int typeId = 3;

  @override
  DocumentType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DocumentType.actOSR;
      case 1:
        return DocumentType.clouseAct;
      case 2:
        return DocumentType.commonInfo;
      default:
        return DocumentType.actOSR;
    }
  }

  @override
  void write(BinaryWriter writer, DocumentType obj) {
    switch (obj) {
      case DocumentType.actOSR:
        writer.writeByte(0);
        break;
      case DocumentType.clouseAct:
        writer.writeByte(1);
        break;
      case DocumentType.commonInfo:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DocumentTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
