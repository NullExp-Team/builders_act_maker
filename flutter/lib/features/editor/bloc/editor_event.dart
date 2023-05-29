part of 'editor_bloc.dart';

@freezed
class EditorEvent with _$EditorEvent {
  const factory EditorEvent.editField({
    required int fieldIndex,
    required String text,
    required List<int>? dependedFields,
  }) = _EditField;
  const factory EditorEvent.save() = _Save;
}
