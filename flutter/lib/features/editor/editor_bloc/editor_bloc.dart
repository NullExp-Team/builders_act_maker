import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/act_data/act_data.dart';

part 'editor_event.dart';
part 'editor_state.dart';
part 'editor_bloc.freezed.dart';

class EditorBloc extends Bloc<EditorEvent, EditorState> {
  EditorBloc({
    required ActData initAct,
  }) : super(EditorLoadedState(act: initAct)) {
    on<_EditField>(_onFieldChanged);
    on<_EditSubField>(_onSubFieldChanged);
    on<_Save>(_onSave);
  }

  EditorLoadedState get loadedState => state as EditorLoadedState;

  void _onFieldChanged(
    _EditField event,
    Emitter<EditorState> emit,
  ) {
    if (state is EditorLoadedState) {
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
  }

  void _onSubFieldChanged(
    _EditSubField event,
    Emitter<EditorState> emit,
  ) {
    if (state is EditorLoadedState) {
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
  }

  void _onSave(
    _Save event,
    Emitter<EditorState> emit,
  ) {
    // TODO потом это всё надо бы к репозиторию привязать, когда экраны будут готовы
  }

  ActData _changeElement(
    ActData act,
    int index,
    String text,
    bool isSubText, [
    bool hasSpace = false,
  ]) =>
      act.copyWith(
        fields: List.generate(
          act.fields.length,
          (i) => i != index
              ? act.fields[i]
              : isSubText
                  ? act.fields[i].copyWith(subText: text, hasSpace: hasSpace)
                  : act.fields[i].copyWith(text: text, hasSpace: hasSpace),
        ),
      );
}
