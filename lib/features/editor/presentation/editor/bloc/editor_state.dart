part of 'editor_cubit.dart';

@freezed
class EditorState with _$EditorState {
  const factory EditorState.loaded({
    required ActData act,
    required bool isNameEditing,
  }) = EditorStateLoaded;
  const factory EditorState.init() = EditorStateInit;
}
