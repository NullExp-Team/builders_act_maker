import '../document_type/document_type.dart';
import '../field_types/field_types.dart';

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
  static const Map<DocumentType, _TypeMetaData> _metaDataByType = {
    DocumentType.actOSR: _TypeMetaData(
      names: [
        'Объект капитального строительства',
        'Застройщик (технический заказчик, эксплуатирующая организация или региональный оператор) ',
        'Лицо, осуществляющее строительство',
        'Лицо, осуществляющее подготовку проектной документации',
        '№ документа',
        'Дата окончания работ',
        'Представитель застройщика по вопросам строительного контроля',
        'Представитель лица, осуществляющего строительство',
        'Представитель лица, осуществляющего строительство, по вопросам строительного контроля',
        'Представитель лица, осуществляющего подготовку проектной документации',
        'Представитель лица, выполнившего работы, подлежащие освидетельствованию',
        'а также иные представители лиц, участвующих в освидетельствовании:',
        //лист 2
        'Произвели осмотр работ, выполненных',
        'К освидетельствованию предъявлены следующие работы',
        'Работы выполнены по проектной документации',
        'При выполнении работ применены',
        'Предъявлены документы, подтверждающие соответствие работ предъявляемым к ним требованиям',
        'Дата начала работ',
        'Дата окончания работ',
        'Работы выполнены в соответствии с (только рабочая документация)',
        'Разрешается производство последующих работ по',
        'Дополнительные сведения',
        'Акт составлен в ',
        'Приложения',
      ],
      types: [
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        DuplicateFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        //лист2
        TextFieldType(),
        DropDownFieldType(name: 'workTypeFromAOSR', dependedMappedFields: [19]),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(dependedFields: [5]),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        NumericFieldType(mainWord: 'экземпляр'),
        TextFieldType(),
      ],
    ),
    DocumentType.commonInfo: _TypeMetaData(
      names: [
        'Представитель застройщика по вопросам строительного контроля',
        'Представитель лица, осуществляющего строительство',
        'Представитель лица, осуществляющего строительство, по вопросам строительного контроля',
        'Представитель лица, осуществляющего подготовку проектной документации',
        'Представитель лица, выполнившего работы, подлежащие освидетельствованию',
        'Представители иных лиц:',
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
  };
}
