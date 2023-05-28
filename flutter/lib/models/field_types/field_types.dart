sealed class FieldType {
  const FieldType();
}

class TextFieldType extends FieldType {
  final List<int>? nextTextMapped;
  const TextFieldType({this.nextTextMapped});
}

class DropDownFieldType extends FieldType {
  final String name;
  const DropDownFieldType({required this.name});
}

//нужен для того, чтобы сохранять структуру массива List<FieldData> и при этом не создавать повторяющееся поле в редакторе
class DuplicateFieldType extends FieldType {
  const DuplicateFieldType();
}
