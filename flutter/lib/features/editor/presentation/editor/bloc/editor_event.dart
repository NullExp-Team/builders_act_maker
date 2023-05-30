part of 'editor_bloc.dart';

@freezed
class EditorEvent with _$EditorEvent {
  const factory EditorEvent.editField({
    required int fieldIndex,
    required String text,
    List<int>? dependedFields,
    String? textForDependedFields,
  }) = _EditField;
  const factory EditorEvent.editSubField({
    required int fieldIndex,
    required String subText,
  }) = _EditSubField;
  const factory EditorEvent.save(
    int? index,
  ) = _Save;
  const factory EditorEvent.init(
    int closureId,
    int actId,
  ) = _Init;
}
