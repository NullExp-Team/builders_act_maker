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
    on<EditorEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
