import '../document_type/document_type.dart';
import '../field_types/field_types.dart';

class FieldMetaData {
  final String name;
  final FieldType type;
  const FieldMetaData(this.name, this.type);
}

class FieldTypeContainer {
  static List<FieldMetaData> getFieldsMetaData(DocumentType type) =>
      _metaDataByType[type] ?? [];

  // Данные типа документов.
  // Представляют собой упорядоченный список отображаемых на экране редакторв имён,
  // типов ввода полей и координат ячейки для записи в документ.
  // Работа с данными полями построена так, что в каждый момент времени в ActData записана готовая
  // к обработке информация.
  // В код с# из flutter передаются лишь данные полей, а координаты полей уже находятся там
  static const Map<DocumentType, List<FieldMetaData>> _metaDataByType = {
    DocumentType.actOSR: [
      // лист 1
      FieldMetaData(
        '№ документа',
        TextFieldType(),
      ),
      FieldMetaData(
        'Дата окончания работ',
        DuplicateFieldType(),
      ),
      //лист 2
      FieldMetaData(
        '1. К освидетельствованию предъявлены следующие работы',
        DropDownFieldType(
          name: 'workTypeFromAOSR',
          dependedMappedFields: [8],
          placeholderNew: '1. Новое значение',
          placeholderDepended: '6. Соответствующее значение',
        ),
      ),
      FieldMetaData(
        '2. Работы выполнены по проектной документации',
        TextFieldType(),
      ),
      FieldMetaData(
        '3. При выполнении работ применены',
        TextFieldType(),
      ),
      FieldMetaData(
        '4. Предъявлены документы, подтверждающие соответствие работ предъявляемым к ним требованиям',
        TextFieldType(),
      ),
      FieldMetaData(
        '5. Дата начала работ',
        TextFieldType(),
      ),
      FieldMetaData(
        '5. Дата окончания работ',
        TextFieldType(dependedFields: [1]),
      ),
      FieldMetaData(
        '6. Работы выполнены в соответствии с (только рабочая документация)',
        TextFieldType(),
      ),
      FieldMetaData(
        '7. Разрешается производство последующих работ по',
        TextFieldType(),
      ),
      FieldMetaData(
        'Дополнительные сведения',
        TextFieldType(),
      ),
      FieldMetaData(
        'Приложения',
        TextFieldType(),
      ),
    ],
    DocumentType.commonInfo: [
      // основа
      FieldMetaData(
        'Объект капитального строительства',
        TextFieldType(),
      ),
      FieldMetaData(
        'Застройщик (технический заказчик, эксплуатирующая организация или региональный оператор) ',
        TextFieldType(),
      ),
      FieldMetaData(
        'Лицо, осуществляющее строительство',
        TextFieldType(),
      ),
      FieldMetaData(
        'Лицо, осуществляющее подготовку проектной документации',
        TextFieldType(),
      ),
      // представители
      FieldMetaData(
        'Представитель застройщика по вопросам строительного контроля',
        TextFieldType(),
      ),
      FieldMetaData(
        'Представитель лица, осуществляющего строительство',
        TextFieldType(),
      ),
      FieldMetaData(
        'Представитель лица, осуществляющего строительство, по вопросам строительного контроля',
        TextFieldType(),
      ),
      FieldMetaData(
        'Представитель лица, осуществляющего подготовку проектной документации',
        TextFieldType(),
      ),
      FieldMetaData(
        'Представитель лица, выполнившего работы, подлежащие освидетельствованию',
        TextFieldType(),
      ),
      FieldMetaData(
        'а также иные представители лиц, участвующих в освидетельствовании:',
        TextFieldType(),
      ),
      // исполнитель и экземпляры
      FieldMetaData(
        'Произвели осмотр работ, выполненных',
        TextFieldType(),
      ),
      FieldMetaData(
        'Акт составлен в ',
        NumericFieldType(mainWord: 'экземпляр'),
      ),
      // подписанты
      FieldMetaData(
        'Представитель застройщика по вопросам строительного контроля',
        SpaceTextFieldType(),
      ),
      FieldMetaData(
        'Представитель лица, осуществляющего строительство',
        SpaceTextFieldType(),
      ),
      FieldMetaData(
        'Представитель лица, осуществляющего строительство, по вопросам строительного контроля',
        SpaceTextFieldType(),
      ),
      FieldMetaData(
        'Представитель лица, осуществляющего подготовку проектной документации',
        SpaceTextFieldType(),
      ),
      FieldMetaData(
        'Представитель лица, выполнившего работы, подлежащие освидетельствованию',
        SpaceTextFieldType(),
      ),
      FieldMetaData(
        'Представители иных лиц:',
        SpaceTextFieldType(),
      ),
    ],
    DocumentType.clouseAct: [
      //объект и комиссия
      FieldMetaData(
        'Объект',
        TextFieldType(),
      ),
      FieldMetaData(
        'Дата',
        TextFieldType(),
      ),
      FieldMetaData(
        'Представитель застройщика по вопросам строительного контроля',
        TextFieldType(),
      ),
      FieldMetaData(
        'Представитель лица, осуществляющего строительство',
        TextFieldType(),
      ),
      FieldMetaData(
        'Представитель лица, осуществляющего строительство, по вопросам строительного контроля',
        TextFieldType(),
      ),
      FieldMetaData(
        'Представитель лица, осуществляющего подготовку проектной документации',
        TextFieldType(),
      ),
      FieldMetaData(
        'Представитель лица, выполнившего работы, подлежащие освидетельствованию',
        TextFieldType(),
      ),
      FieldMetaData(
        'а также иные представители лиц, участвующих в освидетельствовании:',
        TextFieldType(),
      ),
      // пункты
      FieldMetaData(
        '1. К освидетельствованию предъявлены следующие работы',
        TextFieldType(),
      ),
      FieldMetaData(
        '2. Работы выполнены по проектной документации',
        TextFieldType(),
      ),
      FieldMetaData(
        'При этом установлено:',
        TextFieldType(),
      ),
      // список
      FieldMetaData(
        'Перечень прилагаемой к акту приемо-сдаточной документации:',
        MultiLineFieldType(isNeedNumireate: true),
      ),
    ],
  };
}
