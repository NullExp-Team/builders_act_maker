import 'routing/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../features/closure/presentation/closure_list_screen/cubit/closure_list_cubit.dart';

abstract final class Di {
  static final _getIt = GetIt.instance;

  static T get<T extends Object>() => _getIt.get<T>();

  static void initialize() {
    _getIt.registerSingleton(GoRouter(routes: $appRoutes));

    _getIt.registerSingleton(
      ClosureListCubit(
        goRouter: get(),
      ),
    );
  }
}
