part of 'editor_bloc.dart';

@freezed
class EditorState with _$EditorState {
  const factory EditorState.error({
    required String message,
  }) = EditorErrorState;
  const factory EditorState.loading() = EditorLoadingState;
  const factory EditorState.loaded({
    required ActData act,
  }) = EditorLoadedState;
}
