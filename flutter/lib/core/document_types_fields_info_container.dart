import '../models/document_type/document_type.dart';
import '../models/field_types/field_types.dart';

class _TypeMetaData {
  final List<String> names;
  final List<FieldType> types;
  const _TypeMetaData({required this.names, required this.types});
}

class FieldTypeContainer {
  static List<String> getFieldsNames(DocumentType type) =>
      _metaDataByType[type]?.names ?? [];

  static List<FieldType> getFieldsTypes(DocumentType type) =>
      _metaDataByType[type]?.types ?? [];

  // данные
  // TODO заполнить данные нормально
  static const Map<DocumentType, _TypeMetaData> _metaDataByType = {
    DocumentType.actOSR: _TypeMetaData(
      types: [
        TextFieldType(dependedFields: [1]),
        TextFieldType(dependedFields: [2]),
        DuplicateFieldType(),
        SpaceTextFieldType(),
        DropDownFieldType(name: 'testName'),
      ],
      names: [
        'Первое поле',
        'Второе поле',
        'Поле, что повторяет первое поле',
        'Поле с пробелом',
        'ДропДаун поле',
      ],
    ),
    DocumentType.commonInfo: _TypeMetaData(
      names: [
        'Представитель застройщика по вопросам строительного контроля',
        'Представитель лица, осуществляющего строительство',
        'Представитель лица, осуществляющего строительство, по вопросам строительного контроля',
        'Представитель лица, осуществляющего под...',
        'Представитель лица, осуществляющего под...',
        'Представитель лица, осуществляющего под...',
      ],
      types: [
        SpaceTextFieldType(),
        SpaceTextFieldType(),
        SpaceTextFieldType(),
        SpaceTextFieldType(),
        SpaceTextFieldType(),
        SpaceTextFieldType(),
      ],
    ),
    //DocumentType.clouseAct : ,
  };
}
