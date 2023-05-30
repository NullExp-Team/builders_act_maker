import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../models/act_data/act_data.dart';
import '../../../../models/field_data/field_data.dart';
import '../../../editor/data/document_type/document_type.dart';
import '../../domain/closures_repository.dart';
import '../closure/closure.dart';

class ClosuresRepositoryHiveImpl implements ClosuresRepository {
  static const String closuresBoxName = 'closures';
  static const String closuresBoxListKey = 'closures';
  static const String closuresBoxDropDownMapKey = 'dropDownMap';

  @override
  Future<void> initRepository() async {
    Directory? dir;
    if (Platform.isAndroid) {
      dir = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      dir = await getApplicationSupportDirectory();
    } else {
      dir = await getTemporaryDirectory();
    }
    Hive.init(dir!.path);

    Hive.registerAdapter(ClosureAdapter());
    Hive.registerAdapter(ActDataAdapter());
    Hive.registerAdapter(FieldDataAdapter());
    Hive.registerAdapter(DocumentTypeAdapter());

    await Hive.openBox(closuresBoxName);
    var closures = Hive.box(closuresBoxName).get(closuresBoxListKey);
    if (closures == null) {
      Hive.box(closuresBoxName).put(closuresBoxListKey, []);
    }

    var dropDownMap = Hive.box(closuresBoxName).get(closuresBoxDropDownMapKey);
    if (dropDownMap == null) {
      Hive.box(closuresBoxName).put(closuresBoxDropDownMapKey, {});
    }
  }

  @override
  List<Closure> loadClosures() {
    return (Hive.box(closuresBoxName).get(closuresBoxListKey) as Iterable)
        .map((e) => e as Closure)
        .toList();
  }

  @override
  Closure loadClosure(int id) {
    return (Hive.box(closuresBoxName).get(closuresBoxListKey) as Iterable)
        .map((e) => e as Closure)
        .firstWhere((element) => element.id == id);
  }

  @override
  void saveClosures(List<Closure> taskList) {
    Hive.box(closuresBoxName).put(closuresBoxListKey, taskList);
  }

  @override
  ActData loadAct(int idClosure, int idAct) {
    return (Hive.box(closuresBoxName).get(closuresBoxListKey) as Iterable)
        .map((e) => e as Closure)
        .firstWhere((element) => element.id == idClosure)
        .acts
        .firstWhere((element) => element.id == idAct);
  }

  @override
  Map<String, List<String>> loadDropDownMap() {
    return (Hive.box(closuresBoxName).get(closuresBoxDropDownMapKey)
            as Map<dynamic, dynamic>)
        .map((key, value) => MapEntry(key, value));
  }

  @override
  void saveDropDownMap(Map<String, List<String>> map) {
    Hive.box(closuresBoxName).put(closuresBoxDropDownMapKey, map);
  }

  ValueListenable? valueListenable;
  @override
  ValueListenable getClosureListenable() {
    valueListenable ??=
        Hive.box(closuresBoxName).listenable(keys: [closuresBoxListKey]);
    return valueListenable!;
  }
}
