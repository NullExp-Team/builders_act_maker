import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../features/closure/data/repository/closures_repository_hive_impl.dart';
import '../features/closure/domain/closures_repository.dart';
import '../features/closure/presentation/closure_detail_screen/cubit/closure_detail_cubit.dart';
import '../features/editor/presentation/drop_down_map/bloc/drop_down_map_cubit.dart';
import '../features/editor/presentation/editor/bloc/editor_cubit.dart';
import 'routing/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../features/closure/presentation/closure_list_screen/cubit/closure_list_cubit.dart';

abstract final class Di {
  static final _getIt = GetIt.instance;

  static T get<T extends Object>() => _getIt.get<T>();

  static Future<void> initialize() async {
    _getIt.registerSingleton(GoRouter(routes: $appRoutes));

    Directory dir = await getTemporaryDirectory();
    Hive.init(dir.path);

    ClosuresRepository localRepo = ClosuresRepositoryHiveImpl();
    await localRepo.initRepository();
    _getIt.registerSingleton<ClosuresRepository>(localRepo);

    _getIt.registerSingleton(
      ClosureListCubit(
        goRouter: get(),
        repository: get(),
      ),
    );

    _getIt.registerSingleton(
      ClosureDetailCubit(
        goRouter: get(),
        repository: get(),
      ),
    );

    _getIt.registerSingleton(
      EditorCubit(
        repository: get(),
      ),
    );

    _getIt.registerSingleton(
      DropDownMapCubit(
        repository: get(),
      ),
    );
  }
}
