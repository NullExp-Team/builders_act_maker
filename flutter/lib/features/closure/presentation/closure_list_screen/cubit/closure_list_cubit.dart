import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/closure/closure.dart';

part 'closure_list_state.dart';
part 'closure_list_cubit.freezed.dart';

class ClosureListCubit extends Cubit<ClosureListState> {
  ClosureListCubit() : super(const ClosureListState.initial());

  Future<void> loadClosures() async {
    emit(const ClosureListState.loading());

    await Future.delayed(const Duration(milliseconds: 1500));

    final closures = [
      for (var i = 0; i < 100; i++) Closure.random(),
    ];

    emit(ClosureListState.loaded(closures: closures));
  }

  void goToClosureDetailScreen() {
    print('goToClosureDetailScreen');
  }

  void goToAddClosureScreen() {
    print('goToAddClosureScreen');
  }
}
