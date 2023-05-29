import '../models/document_type/document_type.dart';
import '../models/field_types/field_types.dart';

class FieldTypeContainer {
  static List<FieldType> getFieldsTypes(DocumentType type) {
    return switch (type) {
      DocumentType.actOSR => _actOSRFieldsTypes,
      DocumentType.clouseAct => _actOSRFieldsTypes,
    };
  }

  static List<String> getFieldsNames(DocumentType type) {
    return switch (type) {
      DocumentType.actOSR => _actOSRFieldsName,
      DocumentType.clouseAct => _actOSRFieldsName,
    };
  }

  static const List<FieldType> _actOSRFieldsTypes = [
    TextFieldType(dependedFields: [1]),
    TextFieldType(dependedFields: [2]),
    DuplicateFieldType(),
    DropDownFieldType(name: 'da'),
  ];

  static const List<String> _actOSRFieldsName = [
    'Первое поле',
    'Второе поле',
    'Поле, что повторяет первое поле',
    'ДропДаун поле',
  ];
}
