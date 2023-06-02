sealed class FieldType {
  const FieldType();
}

class TextFieldType extends FieldType {
  // содержит индексы тех TextField, для которых этот текст является их началом. Этот текст записывается subText
  final List<int>? dependedFields;
  const TextFieldType({this.dependedFields});
}

class DropDownFieldType extends FieldType {
  final String name;
  final String? placeholderNew;
  final String? placeholderDepended;
  // аналогично массиву из TextFieldType, но текст проходит через map
  final List<int>? dependedMappedFields;
  const DropDownFieldType({
    required this.name,
    this.dependedMappedFields,
    this.placeholderNew,
    this.placeholderDepended,
  });
}

//нужен для того, чтобы сохранять структуру массива List<FieldData> и при этом не создавать повторяющееся поле в редакторе
class DuplicateFieldType extends FieldType {
  const DuplicateFieldType();
}

class SpaceTextFieldType extends FieldType {
  const SpaceTextFieldType();
}

class NumericFieldType extends FieldType {
  final String mainWord;
  const NumericFieldType({required this.mainWord});
}
