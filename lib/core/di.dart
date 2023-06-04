import 'dart:io';

import 'package:hive/hive.dart';

import '../features/closure/data/repository/closures_repository_hive_impl.dart';
import '../features/closure/domain/closures_repository.dart';
import 'routing/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

abstract final class Di {
  static final _getIt = GetIt.instance;

  static T get<T extends Object>() => _getIt.get<T>();

  static Future<void> initialize() async {
    _getIt.registerSingleton(GoRouter(routes: $appRoutes));

    //сохранения лежат в одной папке с самой программой
    Directory dir = Directory('saves');
    Hive.init(dir.path);

    ClosuresRepository localRepo = ClosuresRepositoryHiveImpl();
    await localRepo.initRepository();
    _getIt.registerSingleton<ClosuresRepository>(localRepo);
  }
}
