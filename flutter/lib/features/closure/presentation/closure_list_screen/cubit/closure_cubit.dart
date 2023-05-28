import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../models/closure/closure.dart';

part 'closure_state.dart';
part 'closure_cubit.freezed.dart';

class ClosureCubit extends Cubit<ClosureState> {
  ClosureCubit() : super(const ClosureState.initial());

  Future<void> loadClosures() async {
    emit(const ClosureState.loading());

    await Future.delayed(const Duration(milliseconds: 1500));

    final closures = [
      for (var i = 0; i < 100; i++) Closure.random(),
    ];

    emit(ClosureState.loaded(closures: closures));
  }

  void goToClosureDetailScreen() {
    print('goToClosureDetailScreen');
  }

  void goToAddClosureScreen() {
    print('goToAddClosureScreen');
  }
}
