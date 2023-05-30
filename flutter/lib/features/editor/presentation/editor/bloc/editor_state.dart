part of 'editor_bloc.dart';

@freezed
class EditorState with _$EditorState {
  const factory EditorState.loaded({
    required ActData act,
  }) = EditorStateLoaded;
  const factory EditorState.init() = EditorStateInit;
}
