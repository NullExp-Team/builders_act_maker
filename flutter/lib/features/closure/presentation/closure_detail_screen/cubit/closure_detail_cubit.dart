import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/closure/closure.dart';

part 'closure_detail_state.dart';
part 'closure_detail_cubit.freezed.dart';

class ClosureDetailCubit extends Cubit<ClosureDetailState> {
  ClosureDetailCubit(super.initialState);

  void setClosure(Closure closure) {
    emit(ClosureDetailState.data(closure: closure));
  }
}
