part of 'closure_list_cubit.dart';

@freezed
sealed class ClosureListState with _$ClosureListState {
  const factory ClosureListState.initial() = ClosureListStateInitial;

  const factory ClosureListState.loading() = ClosureListStateLoading;

  const factory ClosureListState.data({
    required List<Closure> closures,
  }) = ClosureListStateData;

  const factory ClosureListState.error({
    required dynamic message,
    required StackTrace stackTrace,
  }) = ClosureListStateError;
}
