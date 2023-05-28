import 'package:get_it/get_it.dart';

import '../features/closure/presentation/closure_list_screen/cubit/closure_list_cubit.dart';

final getIt = GetIt.instance;

abstract final class Di {
  static void initialize() {
    getIt.registerSingleton(ClosureListCubit());
  }
}
