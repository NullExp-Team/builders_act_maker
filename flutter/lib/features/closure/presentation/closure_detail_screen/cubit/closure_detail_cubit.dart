import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/di.dart';
import '../../../../../models/act_data/act_data.dart';
import '../../../../editor/data/document_type/document_type.dart';
import '../../../data/closure/closure.dart';
import '../../../domain/closures_repository.dart';
import '../../closure_list_screen/cubit/closure_list_cubit.dart';

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

  void saveChanges(ActData? act) {
    if (state is! ClosureDetailLoadedState) {
      return;
    }
    if (act != null) {
      if (act.type == DocumentType.commonInfo) {
        emit(
          ClosureDetailState.loaded(
            closure: loadedState.closure.copyWith(commonInfo: act),
          ),
        );
      } else {
        int indexOfChanged = loadedState.closure.acts
            .indexWhere((element) => element.id == act.id);
        emit(
          ClosureDetailState.loaded(
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
