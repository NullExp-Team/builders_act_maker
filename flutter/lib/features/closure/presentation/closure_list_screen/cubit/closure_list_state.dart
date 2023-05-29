part of 'closure_list_cubit.dart';

@freezed
sealed class ClosureListState with _$ClosureListState {
  const factory ClosureListState.initial() = ClosureListInitialState;

  const factory ClosureListState.loading() = ClosureListLoadingState;

  const factory ClosureListState.loaded({
    required List<Closure> closures,
  }) = ClosureListLoadedState;

  const factory ClosureListState.error({
    required dynamic message,
    required StackTrace stackTrace,
  }) = ClosureListErrorState;
}
