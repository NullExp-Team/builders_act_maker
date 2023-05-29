import '../models/document_type/document_type.dart';
import '../models/field_types/field_types.dart';

class FieldTypeContainer {
  static List<String> getFieldsNames(DocumentType type) {
    return switch (type) {
      DocumentType.actOSR => _actOSRName,
      DocumentType.clouseAct => _actOSRName,
      DocumentType.commonInfo => _commonInfoName,
    };
  }

  static List<FieldType> getFieldsTypes(DocumentType type) {
    return switch (type) {
      DocumentType.actOSR => _actOSRTypes,
      DocumentType.clouseAct => _actOSRTypes,
      DocumentType.commonInfo => _commonInfoTypes,
    };
  }

  // данные
  // TODO заполнить данные нормально и заполнить их для другого документа

  static const List<String> _actOSRName = [
    'Первое поле',
    'Второе поле',
    'Поле, что повторяет первое поле',
    'Поле с пробелом',
    'ДропДаун поле',
  ];

  static const List<FieldType> _actOSRTypes = [
    TextFieldType(dependedFields: [1]),
    TextFieldType(dependedFields: [2]),
    DuplicateFieldType(),
    SpaceTextFieldType(),
    DropDownFieldType(name: 'testName'),
  ];

  static const List<String> _commonInfoName = [
    'Представитель застройщика по вопросам строительного контроля',
    'Представитель лица, осуществляющего строительство',
    'Представитель лица, осуществляющего строительство, по вопросам строительного контроля',
    'Представитель лица, осуществляющего под...',
    'Представитель лица, осуществляющего под...',
    'Представитель лица, осуществляющего под...',
  ];

  static const List<FieldType> _commonInfoTypes = [
    SpaceTextFieldType(),
    SpaceTextFieldType(),
    SpaceTextFieldType(),
    SpaceTextFieldType(),
    SpaceTextFieldType(),
    SpaceTextFieldType(),
  ];
}
