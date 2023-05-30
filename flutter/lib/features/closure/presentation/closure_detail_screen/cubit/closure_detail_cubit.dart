import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/closure/closure.dart';

part 'closure_detail_state.dart';
part 'closure_detail_cubit.freezed.dart';

class ClosureDetailCubit extends Cubit<ClosureDetailState> {
  ClosureDetailCubit(super.initialState);

  void setClosure(Closure closure) {
    emit(ClosureDetailState.data(closure: closure));
  }

  void reorderGrid(Iterable<({int oldIndex, int newIndex})> orderUpdates) {
    final closure = state.maybeWhen(
      data: (closure) => closure,
      orElse: () => null,
    );

    if (closure == null) {
      return;
    }

    final newItems = closure.acts.toList();

    for (final update in orderUpdates) {
      final item = newItems.removeAt(update.oldIndex);
      newItems.insert(update.newIndex, item);
    }

    emit(ClosureDetailState.data(closure: closure.copyWith(acts: newItems)));
  }
}
