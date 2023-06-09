import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/act_data/act_data.dart';
import '../../../../closure/domain/closures_repository.dart';
import '../../../data/document_type/document_type.dart';

part 'editor_state.dart';
part 'editor_cubit.freezed.dart';

class EditorCubit extends Cubit<EditorState> {
  final ClosuresRepository repository;
  EditorCubit({required this.repository}) : super(const EditorStateInit());

  EditorStateLoaded get loadedState => state as EditorStateLoaded;

  bool isActHasChanges(
    int closureId,
    int actId,
  ) {
    if (state is! EditorStateLoaded) {
      return false;
    }

    if (loadedState.act.type != DocumentType.commonInfo) {
      return repository.loadAct(closureId, actId) != loadedState.act;
    } else {
      return repository.loadClosure(closureId)!.commonInfo != loadedState.act;
    }
  }

  void init(
    int closureId,
    int actId,
  ) {
    //случай открытия общей информации
    if (actId == -1) {
      emit(
        EditorState.loaded(
          act: repository.loadClosure(closureId)!.commonInfo,
          isNameEditing: false,
        ),
      );
    } else {
      emit(
        EditorState.loaded(
          act: repository.loadAct(closureId, actId),
          isNameEditing: false,
        ),
      );
    }
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
        String dependedText = newAct.fields[i].text != ''
            ? ' ${textForDependedFields ?? text}'
            : textForDependedFields ?? text;
        newAct = _changeElement(
          newAct,
          i,
          dependedText,
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
    required bool isHasSpace,
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
      isHasSpace,
    );

    emit(
      loadedState.copyWith(
        act: newAct,
      ),
    );
  }

  void changeNumericField({
    required int fieldIndex,
    required String text,
    required String mainWord,
  }) {
    if (state is! EditorStateLoaded) {
      return;
    }
    // меняем сам текст
    ActData newAct = _changeElement(loadedState.act, fieldIndex, text, false);

    //работа с числом
    if (int.tryParse(text) != null) {
      final intText = int.parse(text);
      if (intText > 0) {
        if (intText == 1) {
          newAct = _changeElement(newAct, fieldIndex, '-ом $mainWordе', true);
        } else if (intText % 5 == 0) {
          newAct = _changeElement(newAct, fieldIndex, '-ти $mainWordах', true);
        } else {
          newAct = _changeElement(newAct, fieldIndex, '-х $mainWordах', true);
        }
      }
    }

    emit(
      loadedState.copyWith(
        act: newAct,
      ),
    );
  }

  void changeMultiLineField({
    required int fieldIndex,
    required String text,
    required bool isNeedNumireate,
  }) {
    if (state is! EditorStateLoaded) {
      return;
    }
    List<String> lines = text.split('\n');
    if (text == '') {
      lines = [];
    }
    // избавляемся от прошлой нумерации
    lines = lines.map((e) {
      final number = RegExp(r'(\d+)\.(\s?)').firstMatch(e);
      if (number != null && number.start == 0) {
        e = e.substring(number.end);
      }
      return e;
    }).toList();

    // соединяем всё в стринг
    String multiLine = '';
    for (int i = 0; i < lines.length; i++) {
      // если нужно, нумеруем
      if (isNeedNumireate) {
        multiLine += '${i + 1}. ';
      }
      multiLine += '${lines[i]}\n';
    }
    if (multiLine != '') {
      multiLine = multiLine.substring(0, multiLine.length - 1);
    }

    // меняем сам текст
    ActData newAct =
        _changeElement(loadedState.act, fieldIndex, multiLine, false);

    emit(
      loadedState.copyWith(
        act: newAct,
      ),
    );
  }

  void save(int closureId) {
    if (state is! EditorStateLoaded) {
      return;
    }

    repository.saveChangedAct(closureId, loadedState.act);
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

  bool onNameEdit(String? newName, int closureId) {
    if (state is! EditorStateLoaded) {
      return false;
    }

    if (loadedState.isNameEditing) {
      //проверяем имя на уникальность, так как этого требует эксель
      final isHasNewName = repository.loadClosure(closureId)!.acts.any(
            (element) =>
                element.id != loadedState.act.id && element.name == newName,
          );
      if (isHasNewName) {
        return false;
      }

      emit(
        loadedState.copyWith(
          isNameEditing: !loadedState.isNameEditing,
          act: loadedState.act.copyWith(name: newName ?? loadedState.act.name),
        ),
      );
    } else {
      emit(loadedState.copyWith(isNameEditing: !loadedState.isNameEditing));
    }

    return true;
  }
}
