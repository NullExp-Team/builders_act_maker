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
  // TODO: расписать бы как это всё работает
  static const Map<DocumentType, _TypeMetaData> _metaDataByType = {
    DocumentType.actOSR: _TypeMetaData(
      names: [
        // лист 1
        '№ документа',
        'Дата окончания работ',
        //лист 2
        '1. К освидетельствованию предъявлены следующие работы',
        '2. Работы выполнены по проектной документации',
        '3. При выполнении работ применены',
        '4. Предъявлены документы, подтверждающие соответствие работ предъявляемым к ним требованиям',
        '5. Дата начала работ',
        '5. Дата окончания работ',
        '6. Работы выполнены в соответствии с (только рабочая документация)',
        '7. Разрешается производство последующих работ по',
        'Дополнительные сведения',
        'Приложения',
      ],
      types: [
        // лист 1
        TextFieldType(),
        DuplicateFieldType(),
        //лист2
        DropDownFieldType(
          name: 'workTypeFromAOSR',
          dependedMappedFields: [8],
          placeholderNew: '1. Новое значение',
          placeholderDepended: '6. Соответствующее значение',
        ),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(dependedFields: [1]),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
      ],
    ),
    DocumentType.commonInfo: _TypeMetaData(
      names: [
        // основа
        'Объект капитального строительства',
        'Застройщик (технический заказчик, эксплуатирующая организация или региональный оператор) ',
        'Лицо, осуществляющее строительство',
        'Лицо, осуществляющее подготовку проектной документации',
        // представители
        'Представитель застройщика по вопросам строительного контроля',
        'Представитель лица, осуществляющего строительство',
        'Представитель лица, осуществляющего строительство, по вопросам строительного контроля',
        'Представитель лица, осуществляющего подготовку проектной документации',
        'Представитель лица, выполнившего работы, подлежащие освидетельствованию',
        'а также иные представители лиц, участвующих в освидетельствовании:',
        // исполнитель и экземпляры
        'Произвели осмотр работ, выполненных',
        'Акт составлен в ',
        // подписанты
        'Представитель застройщика по вопросам строительного контроля',
        'Представитель лица, осуществляющего строительство',
        'Представитель лица, осуществляющего строительство, по вопросам строительного контроля',
        'Представитель лица, осуществляющего подготовку проектной документации',
        'Представитель лица, выполнившего работы, подлежащие освидетельствованию',
        'Представители иных лиц:',
      ],
      types: [
        // основа
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        // представители
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        // исполнитель и экземпляры
        TextFieldType(),
        NumericFieldType(mainWord: 'экземпляр'),
        // подписанты
        SpaceTextFieldType(),
        SpaceTextFieldType(),
        SpaceTextFieldType(),
        SpaceTextFieldType(),
        SpaceTextFieldType(),
        SpaceTextFieldType(),
      ],
    ),
    DocumentType.clouseAct: _TypeMetaData(
      names: [
        //объект и комиссия
        'Объект',
        'Дата',
        'Представитель застройщика по вопросам строительного контроля',
        'Представитель лица, осуществляющего строительство',
        'Представитель лица, осуществляющего строительство, по вопросам строительного контроля',
        'Представитель лица, осуществляющего подготовку проектной документации',
        'Представитель лица, выполнившего работы, подлежащие освидетельствованию',
        'а также иные представители лиц, участвующих в освидетельствовании:',
        // пункты
        '1. К освидетельствованию предъявлены следующие работы',
        '2. Работы выполнены по проектной документации',
        'При этом установлено:',
        // список
        'Перечень прилагаемой к акту приемо-сдаточной документации:',
      ],
      types: [
        //объект и комиссия
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        // пункты
        TextFieldType(),
        TextFieldType(),
        TextFieldType(),
        // список
        MultiLineFieldType(isNeedNumireate: true),
      ],
    ),
  };
}
