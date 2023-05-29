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

  // данные
  // TODO заполнить данные нормально и заполнить их для другого документа

  static const List<String> _actOSRFieldsName = [
    'Первое поле',
    'Второе поле',
    'Поле, что повторяет первое поле',
    'Поле с пробелом',
    'ДропДаун поле',
  ];

  static const List<FieldType> _actOSRFieldsTypes = [
    TextFieldType(dependedFields: [1]),
    TextFieldType(dependedFields: [2]),
    DuplicateFieldType(),
    SpaceTextFieldType(),
    DropDownFieldType(name: 'da'),
  ];
}
