part of 'closure_cubit.dart';

@freezed
sealed class ClosureState with _$ClosureState {
  const factory ClosureState.initial() = ClosureInitialState;

  const factory ClosureState.loading() = ClosureLoadingState;

  const factory ClosureState.loaded({
    required List<Closure> closures,
  }) = ClosureLoadedState;

  const factory ClosureState.error({
    required dynamic message,
    required StackTrace stackTrace,
  }) = ClosureErrorState;
}
