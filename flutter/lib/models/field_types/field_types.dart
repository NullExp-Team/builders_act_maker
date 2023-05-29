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
  // аналогично массиву из TextFieldType, но текст проходит через map
  final List<int>? dependedMappedFields;
  const DropDownFieldType({
    required this.name,
    this.dependedMappedFields,
  });
}

//нужен для того, чтобы сохранять структуру массива List<FieldData> и при этом не создавать повторяющееся поле в редакторе
class DuplicateFieldType extends FieldType {
  const DuplicateFieldType();
}

class SpaceTextFieldType extends FieldType {
  const SpaceTextFieldType();
}
