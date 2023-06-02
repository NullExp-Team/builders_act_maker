import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../editor/data/act_data/act_data.dart';
import '../../../../../core/di.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../editor/data/document_type/document_type.dart';
import '../../../data/closure/closure.dart';
import '../../../domain/closures_repository.dart';
import '../../closure_list_screen/cubit/closure_list_cubit.dart';

part 'closure_detail_state.dart';
part 'closure_detail_cubit.freezed.dart';

class ClosureDetailCubit extends Cubit<ClosureDetailState> {
  final GoRouter goRouter;
  final ClosuresRepository repository;

  ClosureDetailCubit({required this.goRouter, required this.repository})
      : super(const ClosureDetailStateInitial());

  ClosureDetailStateData get loadedState => state as ClosureDetailStateData;

  void goToActEditor(int actId) {
    goRouter.go(
      ActEditorRoute(closureId: loadedState.closure.id, actId: actId).location,
    );
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

    final newClosure = closure.copyWith(acts: newItems);
    Di.get<ClosureListCubit>().changeClosure(newClosure);
    emit(loadedState.copyWith(closure: newClosure));
  }

  void createRandomAct() {
    final closure = state.maybeWhen(
      data: (closure, isNameChanging) => closure,
      orElse: () => null,
    );
    if (closure == null) return;

    final newItems = [...closure.acts];
    final newAct = ActData.random();
    newItems.add(newAct);

    final newClosure = closure.copyWith(acts: newItems);
    Di.get<ClosureListCubit>().changeClosure(newClosure);
    emit(loadedState.copyWith(closure: newClosure));
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

    final newClosure = closure.copyWith(acts: newItems);
    Di.get<ClosureListCubit>().changeClosure(newClosure);
    emit(loadedState.copyWith(closure: newClosure));
  }

  void deleteAct(ActData act) {
    final closure = state.maybeWhen(
      data: (closure, isNameChanging) => closure,
      orElse: () => null,
    );
    if (closure == null) return;

    final newItems = closure.acts.where((element) => element != act).toList();

    final newClosure = closure.copyWith(acts: newItems);
    Di.get<ClosureListCubit>().changeClosure(newClosure);
    emit(loadedState.copyWith(closure: newClosure));
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

    final newClosure = closure.copyWith(acts: newItems);
    Di.get<ClosureListCubit>().changeClosure(newClosure);
    emit(loadedState.copyWith(closure: newClosure));
  }

  void setClosure(int closureId) {
    final a = repository.getClosureListenable();
    if (state is ClosureDetailStateData) {
      endSub();
    }
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

    a.addListener(_onChanges);
  }

  void endSub() {
    final a = repository.getClosureListenable();
    a.removeListener(_onChanges);
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
        closure: closure,
      ),
    );
  }

  //TODO: функция для вызова её из кубита редактора. Временное решение
  void saveChanges(ActData act) {
    if (state is! ClosureDetailStateData) {
      return;
    }
    if (act.type == DocumentType.commonInfo) {
      emit(
        loadedState.copyWith(
          closure: loadedState.closure.copyWith(commonInfo: act),
        ),
      );
    } else {
      int indexOfChanged = loadedState.closure.acts
          .indexWhere((element) => element.id == act.id);
      emit(
        loadedState.copyWith(
          closure: loadedState.closure.copyWith(
            acts: List.from(loadedState.closure.acts)..[indexOfChanged] = act,
          ),
        ),
      );
    }

    Di.get<ClosureListCubit>().changeClosure(loadedState.closure);
  }

  bool onNameEdit(String? newName) {
    if (state is! ClosureDetailStateData) {
      return false;
    }

    if (loadedState.isNameEditing) {
      emit(
        loadedState.copyWith(
          isNameEditing: !loadedState.isNameEditing,
          closure: loadedState.closure
              .copyWith(name: newName ?? loadedState.closure.name),
        ),
      );
      Di.get<ClosureListCubit>().changeClosure(loadedState.closure);
    } else {
      emit(loadedState.copyWith(isNameEditing: !loadedState.isNameEditing));
    }
    return true;
  }

  bool changePath(String? newPath) {
    if (state is! ClosureDetailStateData || newPath == null) {
      return false;
    }

    emit(
      loadedState.copyWith(
        closure: loadedState.closure.copyWith(path: newPath),
      ),
    );
    Di.get<ClosureListCubit>().changeClosure(loadedState.closure);
    return true;
  }
}
