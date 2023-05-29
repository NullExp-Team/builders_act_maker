part of 'closure_detail_cubit.dart';

@freezed
sealed class ClosureDetailState with _$ClosureDetailState {
  const factory ClosureDetailState.initial() = ClosureDetailInitialState;

  const factory ClosureDetailState.loading() = ClosureDetailLoadingState;

  const factory ClosureDetailState.loaded({
    required Closure closure,
  }) = ClosureDetailLoadedState;

  const factory ClosureDetailState.error({
    required dynamic message,
    required StackTrace stackTrace,
  }) = ClosureDetailErrorState;
}
