import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../editor/data/act_data/act_data.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../editor/data/document_type/document_type.dart';
import '../../../data/closure/closure.dart';
import '../../../domain/closures_repository.dart';

part 'closure_detail_state.dart';
part 'closure_detail_cubit.freezed.dart';

class ClosureDetailCubit extends Cubit<ClosureDetailState> {
  final GoRouter goRouter;
  final ClosuresRepository repository;

  ClosureDetailCubit({required this.goRouter, required this.repository})
      : super(const ClosureDetailStateInitial());

  ClosureDetailStateData get loadedState => state as ClosureDetailStateData;

  void subscribeClosure(int closureId) {
    final valueListenable = repository.getClosureListenable();
    final closure = repository.loadClosure(closureId);

    if (closure == null) {
      emit(
        ClosureDetailState.error(
          message: 'Закрытие не найдено',
          stackTrace: StackTrace.current,
        ),
      );
    } else {
      emit(
        ClosureDetailState.data(
          closure: closure,
          isNameEditing: false,
        ),
      );
    }

    valueListenable.addListener(_onChanges);
  }

  @override
  Future<void> close() async {
    final valueListenable = repository.getClosureListenable();
    valueListenable.removeListener(_onChanges);
    await super.close();
  }

  void _onChanges() {
    final closure = state.maybeWhen(
      data: (closure, isNameChanging) => closure,
      orElse: () => null,
    );
    if (closure == null) return;

    final newClosure = repository.loadClosure(loadedState.closure.id);
    if (newClosure == null) {
      emit(
        ClosureDetailState.error(
          message: 'Закрытие не найдено',
          stackTrace: StackTrace.current,
        ),
      );
      return;
    }

    emit(
      loadedState.copyWith(
        closure: newClosure,
      ),
    );
  }

  bool isClosureHasChanges() {
    if (state is! ClosureDetailStateData) {
      return false;
    }

    return repository.loadClosure(loadedState.closure.id)! !=
        loadedState.closure;
  }

  void goToActEditor(int actId) {
    goRouter.go(
      ActEditorRoute(closureId: loadedState.closure.id, actId: actId).location,
    );
  }

  void _saveClosure(Closure newClosure) {
    emit(loadedState.copyWith(closure: newClosure));
    repository.saveClosure(newClosure);
  }

  void createAct(DocumentType type) {
    final closure = state.maybeWhen(
      data: (closure, isNameChanging) => closure,
      orElse: () => null,
    );
    if (closure == null) return;

    int newIndex = 1 +
        loadedState.closure.acts.fold(
          0,
          ((previousValue, element) => max(previousValue, element.id)),
        );

    final newAct = ActData.create(type, newIndex);
    final newItems = [...closure.acts];
    newItems.add(newAct);

    final newClosure = loadedState.closure.copyWith(acts: newItems);
    _saveClosure(newClosure);
    goToActEditor(newAct.id);
  }

  void duplicateAct(ActData act) {
    final closure = state.maybeWhen(
      data: (closure, isNameChanging) => closure,
      orElse: () => null,
    );
    if (closure == null) return;

    int newIndex = 1 +
        loadedState.closure.acts.fold(
          0,
          ((previousValue, element) => max(previousValue, element.id)),
        );

    final actClone = act.copyWith(name: '${act.name} (копия)', id: newIndex);

    final newItems = [...closure.acts];
    final indexForInsert = newItems.indexOf(act) + 1;
    newItems.insert(indexForInsert, actClone);

    final newClosure = loadedState.closure.copyWith(acts: newItems);
    _saveClosure(newClosure);
  }

  void deleteAct(ActData act) {
    final closure = state.maybeWhen(
      data: (closure, isNameChanging) => closure,
      orElse: () => null,
    );
    if (closure == null) return;

    final newItems = closure.acts.where((element) => element != act).toList();

    final newClosure = loadedState.closure.copyWith(acts: newItems);
    _saveClosure(newClosure);
  }

  void reorderGrid(Iterable<({int oldIndex, int newIndex})> orderUpdates) {
    final closure = state.maybeWhen(
      data: (closure, isNameChanging) => closure,
      orElse: () => null,
    );
    if (closure == null) return;

    final newItems = closure.acts.toList();

    for (final update in orderUpdates) {
      final item = newItems.removeAt(update.oldIndex);
      newItems.insert(update.newIndex, item);
    }

    final newClosure = loadedState.closure.copyWith(acts: newItems);
    _saveClosure(newClosure);
  }

  bool onNameEdit(String? newName) {
    if (state is! ClosureDetailStateData) {
      return false;
    }

    if (loadedState.isNameEditing) {
      emit(
        loadedState.copyWith(
          isNameEditing: !loadedState.isNameEditing,
        ),
      );

      final newClosure = loadedState.closure
          .copyWith(name: newName ?? loadedState.closure.name);
      _saveClosure(newClosure);
    } else {
      emit(loadedState.copyWith(isNameEditing: !loadedState.isNameEditing));
    }
    return true;
  }

  bool changePath(String? newPath) {
    if (state is! ClosureDetailStateData || newPath == null) {
      return false;
    }

    final newClosure = loadedState.closure.copyWith(path: newPath);
    _saveClosure(newClosure);
    return true;
  }
}
