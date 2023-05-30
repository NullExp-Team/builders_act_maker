import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../../models/act_data/act_data.dart';
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

  void editAct(ActData act) {}

  void duplicateAct(ActData act) {
    final closure = state.maybeWhen(
      data: (closure) => closure,
      orElse: () => null,
    );
    if (closure == null) return;

    final newItems = [...closure.acts];
    final actClone = act.copyWith(
      name: '${act.name} (копия)',
    );
    final index = newItems.indexOf(act);
    newItems.insert(index + 1, actClone);

    final newClosure = closure.copyWith(acts: newItems);

    emit(ClosureDetailState.data(closure: newClosure));
  }

  void deleteAct(ActData act) {
    final closure = state.maybeWhen(
      data: (closure) => closure,
      orElse: () => null,
    );
    if (closure == null) return;

    final newItems = closure.acts.where((element) => element != act).toList();

    final newClosure = closure.copyWith(acts: newItems);

    emit(ClosureDetailState.data(closure: newClosure));
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

  void goToActEditor(int actId) {
    if (state is! ClosureDetailStateData) return;

    goRouter.go(
      ActEditorRoute(closureId: loadedState.closure.id, actId: actId).location,
    );
  }

  void setClosure(int closureId) {
    final a = repository.getClosureListenable();
    if (state is ClosureDetailStateData) {
      endSub();
    }
    emit(ClosureDetailState.data(closure: repository.loadClosure(closureId)));
    a.addListener(_onChanges);
  }

  void endSub() {
    final a = repository.getClosureListenable();
    a.removeListener(_onChanges);
  }

  void _onChanges() => emit(
        ClosureDetailState.data(
          closure: repository.loadClosure(loadedState.closure.id),
        ),
      );

  void saveChanges(ActData? act) {
    if (state is! ClosureDetailStateData) {
      return;
    }
    if (act != null) {
      if (act.type == DocumentType.commonInfo) {
        emit(
          ClosureDetailState.data(
            closure: loadedState.closure.copyWith(commonInfo: act),
          ),
        );
      } else {
        int indexOfChanged = loadedState.closure.acts
            .indexWhere((element) => element.id == act.id);
        emit(
          ClosureDetailState.data(
            closure: loadedState.closure.copyWith(
              acts: List.from(loadedState.closure.acts)..[indexOfChanged] = act,
            ),
          ),
        );
      }
    }

    Di.get<ClosureListCubit>().changeClosure(loadedState.closure);
  }
}
