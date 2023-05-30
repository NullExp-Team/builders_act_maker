import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/di.dart';
import '../../../../../models/act_data/act_data.dart';
import '../../../../closure/domain/closures_repository.dart';
import '../../../../closure/presentation/closure_detail_screen/cubit/closure_detail_cubit.dart';

part 'editor_event.dart';
part 'editor_state.dart';
part 'editor_bloc.freezed.dart';

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  final ClosuresRepository repository;
  EditorBloc({required this.repository}) : super(const EditorStateInit()) {
    on<_EditField>(_onFieldChanged);
    on<_EditSubField>(_onSubFieldChanged);
    on<_Save>(_onSave);
    on<_Init>(_onInit);
  }

  EditorStateLoaded get loadedState => state as EditorStateLoaded;

  void _onInit(
    _Init event,
    Emitter<EditorState> emit,
  ) {
    emit(
      EditorState.loaded(
        act: repository.loadAct(event.closureId, event.actId),
      ),
    );
  }

  void _onFieldChanged(
    _EditField event,
    Emitter<EditorState> emit,
  ) {
    if (state is! EditorStateLoaded) {
      return;
    }
    // меняем сам текст
    ActData newAct =
        _changeElement(loadedState.act, event.fieldIndex, event.text, false);

    // меняем зависимые текста
    if (event.dependedFields != null) {
      for (int i in event.dependedFields!) {
        newAct = _changeElement(
          newAct,
          i,
          event.textForDependedFields ?? event.text,
          true,
        );
      }
    }

    emit(
      loadedState.copyWith(
        act: newAct,
      ),
    );
  }

  void _onSubFieldChanged(
    _EditSubField event,
    Emitter<EditorState> emit,
  ) {
    if (state is! EditorStateLoaded) {
      return;
    }
    // меняем доп текст
    ActData newAct = _changeElement(
      loadedState.act,
      event.fieldIndex,
      event.subText,
      true,
      true,
    );

    emit(
      loadedState.copyWith(
        act: newAct,
      ),
    );
  }

  void _onSave(
    _Save event,
    Emitter<EditorState> emit,
  ) {
    if (state is! EditorStateLoaded) {
      return;
    }

    Di.get<ClosureDetailCubit>().saveChanges(loadedState.act);
  }

  ActData _changeElement(
    ActData act,
    int index,
    String text,
    bool isSubText, [
    bool hasSpace = false,
  ]) {
    final newFieldData = isSubText
        ? act.fields[index].copyWith(subText: text, hasSpace: hasSpace)
        : act.fields[index].copyWith(text: text, hasSpace: hasSpace);

    return act.copyWith(
      fields: List.generate(
        act.fields.length,
        (i) => i != index ? act.fields[i] : newFieldData,
      ),
    );
  }
}
