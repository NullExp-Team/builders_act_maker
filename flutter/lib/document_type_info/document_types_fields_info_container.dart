import '../models/document_type/document_type.dart';
import '../models/field_types/field_types.dart';

class FieldTypeContainer {
  static List<FieldType> getFieldsTypes(DocumentType type) {
    return switch (type) {
      DocumentType.actOSR => _actOSRFieldsTypes,
      DocumentType.clouseAct => _actOSRFieldsTypes,
    };
  }

  // todo norm
  static const List<FieldType> _actOSRFieldsTypes = [
    TextFieldType(),
    TextFieldType(nextTextMapped: [2]),
    DuplicateFieldType(),
    DropDownFieldType(name: 'da'),
  ];
}
