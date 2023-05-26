import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable()
@DocumentTypeConverter()
sealed class DocumentType {
  DocumentType(this.key, this.maxCOunt);
  final String key;
  final int maxCOunt;

  static DocumentType fromJson(String json) {
    return DocumentType(json, 1);
  }

  String toJson() {
    return key;
  }
}

class DocumentTypeConverter implements JsonConverter<DocumentType?, String?> {
  const DocumentTypeConverter();

  @override
  DocumentType? fromJson(String? json) {
    if (json == null) {
      return null;
    }
    return DocumentType(json, 1);
  }

  @override
  String? toJson(DocumentType? object) {
    if (object == null) {
      return null;
    }
    return object.toString();
  }
}
