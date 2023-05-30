import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/di.dart';
import '../../../data/closure/closure.dart';
import '../../../domain/closures_repository.dart';

part 'closure_detail_state.dart';
part 'closure_detail_cubit.freezed.dart';

class ClosureDetailCubit extends Cubit<ClosureDetailState> {
  final ClosuresRepository repository;
  ClosureDetailCubit({required this.repository})
      : super(const ClosureDetailInitialState());

  ClosureDetailLoadedState get loadedState => state as ClosureDetailLoadedState;

  void setClosure(int closureId) {
    final a = repository.getClosureListenable();
    if (state is ClosureDetailLoadedState) {
      endSub();
    }
    emit(ClosureDetailState.loaded(closure: repository.loadClosure(closureId)));
    a.addListener(_onChanges);
  }

  void endSub() {
    final a = repository.getClosureListenable();
    a.removeListener(_onChanges);
  }

  void _onChanges() => emit(
        ClosureDetailState.loaded(
          closure: repository.loadClosure(loadedState.closure.id),
        ),
      );
}
