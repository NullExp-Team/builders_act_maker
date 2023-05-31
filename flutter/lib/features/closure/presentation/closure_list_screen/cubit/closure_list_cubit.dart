import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/routes.dart';
import '../../../data/closure/closure.dart';
import '../../../domain/closures_repository.dart';

part 'closure_list_state.dart';
part 'closure_list_cubit.freezed.dart';

class ClosureListCubit extends Cubit<ClosureListState> {
  final GoRouter goRouter;
  final ClosuresRepository repository;

  ClosureListCubit({required this.goRouter, required this.repository})
      : super(const ClosureListState.initial());

  ClosureListStateData get loadedState => state as ClosureListStateData;

  Future<void> loadClosures() async {
    emit(const ClosureListState.loading());

    final closures = repository.loadClosures();

    emit(ClosureListState.data(closures: closures));
  }

  void goToClosureDetail(Closure closure) {
    final location = ClosureDetailRoute(closureId: closure.id).location;
    print(location);
    goRouter.go(location);
  }

  void addNewClosure() {
    if (state is! ClosureListStateData) {
      return;
    }
    emit(
      ClosureListState.data(
        closures: List.from((loadedState).closures)..add(Closure.random()),
      ),
    );
    repository.saveClosures(loadedState.closures);
  }

  void deleteClosure(int index) {
    if (state is! ClosureListStateData) {
      return;
    }
    emit(
      ClosureListState.data(
        closures: List.from(loadedState.closures)..removeAt(index),
      ),
    );
    repository.saveClosures(loadedState.closures);
  }

  void changeClosure(Closure closure) {
    if (state is! ClosureListStateData) {
      return;
    }
    int indexOfChanged =
        loadedState.closures.indexWhere((element) => element.id == closure.id);
    if (indexOfChanged != -1) {
      emit(
        ClosureListState.data(
          closures: List.from(loadedState.closures)..[indexOfChanged] = closure,
        ),
      );
      repository.saveClosures(loadedState.closures);
    }
  }
}
