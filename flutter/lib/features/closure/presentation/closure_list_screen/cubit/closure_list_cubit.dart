import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/routes.dart';
import '../../../data/closure/closure.dart';

part 'closure_list_state.dart';
part 'closure_list_cubit.freezed.dart';

class ClosureListCubit extends Cubit<ClosureListState> {
  final GoRouter goRouter;

  ClosureListCubit({required this.goRouter})
      : super(const ClosureListState.initial());

  Future<void> loadClosures() async {
    emit(const ClosureListState.loading());

    await Future.delayed(const Duration(milliseconds: 1000));

    final closures = [
      for (var i = 0; i < 100; i++) Closure.random(),
    ];

    emit(ClosureListState.data(closures: closures));
  }

  void goToClosureDetail(Closure closure) {
    final location = ClosureDetailRoute(closureId: closure.id).location;
    print(location);
    goRouter.go(location);
  }

  void addNewClosure() {
    print('addNewClosure');
  }
}
