part of 'closure_detail_cubit.dart';

@freezed
sealed class ClosureDetailState with _$ClosureDetailState {
  const factory ClosureDetailState.initial() = ClosureDetailStateInitial;

  const factory ClosureDetailState.loading() = ClosureDetailStateLoading;

  const factory ClosureDetailState.data({
    required Closure closure,
    required bool isNameEditing,
  }) = ClosureDetailStateData;

  const factory ClosureDetailState.error({
    required dynamic message,
    required StackTrace stackTrace,
  }) = ClosureDetailStateError;
}
