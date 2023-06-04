import 'dart:math';

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
    // загружаем данные
    final closures = repository.loadClosures();
    emit(ClosureListState.data(closures: closures));

    //подписываемся на изменения. Отписку не реализуем, ибо экземпляр кубита единственный на всё приложение
    final valueListenable = repository.getClosureListenable();
    valueListenable.addListener(
      () => emit(loadedState.copyWith(closures: repository.loadClosures())),
    );
  }

  void goToClosureDetail(Closure closure) {
    final location = ClosureDetailRoute(closureId: closure.id).location;
    goRouter.go(location);
  }

  void addNewClosure() {
    if (state is! ClosureListStateData) {
      return;
    }

    int newIndex = 1 +
        loadedState.closures.fold(
          0,
          ((previousValue, element) => max(previousValue, element.id)),
        );

    emit(
      ClosureListState.data(
        closures: List.from(loadedState.closures)
          ..insert(0, Closure.newClosure(newIndex)),
      ),
    );
    repository.saveClosures(loadedState.closures);
    goToClosureDetail(loadedState.closures[0]);
  }

  void copyClosure(Closure closure) {
    if (state is! ClosureListStateData) {
      return;
    }

    int newIndex = 1 +
        loadedState.closures.fold(
          0,
          ((previousValue, element) => max(previousValue, element.id)),
        );

    emit(
      ClosureListState.data(
        closures: List.from(loadedState.closures)
          ..insert(0, closure.copyWith(id: newIndex)),
      ),
    );
    repository.saveClosures(loadedState.closures);
    goToClosureDetail(loadedState.closures[0]);
  }

  void deleteClosure(Closure closure) {
    if (state is! ClosureListStateData) {
      return;
    }
    emit(
      ClosureListState.data(
        closures: List.from(loadedState.closures)..remove(closure),
      ),
    );
    repository.saveClosures(loadedState.closures);
  }
}
