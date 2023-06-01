import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/di.dart';
import '../../../../../models/act_data/act_data.dart';
import '../../../../closure/domain/closures_repository.dart';
import '../../../../closure/presentation/closure_detail_screen/cubit/closure_detail_cubit.dart';

part 'editor_state.dart';
part 'editor_cubit.freezed.dart';

class EditorCubit extends Cubit<EditorState> {
  final ClosuresRepository repository;
  EditorCubit({required this.repository}) : super(const EditorStateInit());

  EditorStateLoaded get loadedState => state as EditorStateLoaded;

  void init(
    int closureId,
    int actId,
  ) {
    emit(
      EditorState.loaded(
        act: repository.loadAct(closureId, actId),
        isNameEditing: false,
      ),
    );
  }

  void changeField({
    required int fieldIndex,
    required String text,
    List<int>? dependedFields,
    String? textForDependedFields,
  }) {
    if (state is! EditorStateLoaded) {
      return;
    }
    // меняем сам текст
    ActData newAct = _changeElement(loadedState.act, fieldIndex, text, false);

    // меняем зависимые текста
    if (dependedFields != null) {
      for (int i in dependedFields) {
        newAct = _changeElement(
          newAct,
          i,
          '${textForDependedFields ?? text} ',
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

  void changeSubField({
    required int fieldIndex,
    required String subText,
  }) {
    if (state is! EditorStateLoaded) {
      return;
    }
    // меняем доп текст
    ActData newAct = _changeElement(
      loadedState.act,
      fieldIndex,
      subText,
      true,
      true,
    );

    emit(
      loadedState.copyWith(
        act: newAct,
      ),
    );
  }

  void save() {
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
      fields: List.from(act.fields)..[index] = newFieldData,
    );
  }

  void onNameEdit(String? newName) {
    if (state is! EditorStateLoaded) {
      return;
    }

    if (loadedState.isNameEditing) {
      emit(
        loadedState.copyWith(
          isNameEditing: !loadedState.isNameEditing,
          act: loadedState.act.copyWith(name: newName ?? loadedState.act.name),
        ),
      );
    } else {
      emit(loadedState.copyWith(isNameEditing: !loadedState.isNameEditing));
    }
  }
}
