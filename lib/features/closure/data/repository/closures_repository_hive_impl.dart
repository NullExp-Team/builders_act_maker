import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../editor/data/act_data/act_data.dart';
import '../../../editor/data/field_data/field_data.dart';
import '../../../editor/data/document_type/document_type.dart';
import '../../../editor/data/drop_down_map_data/drop_down_map_data.dart';
import '../../domain/closures_repository.dart';
import '../closure/closure.dart';

class ClosuresRepositoryHiveImpl implements ClosuresRepository {
  static const String closuresBoxName = 'closures';
  static const String closuresBoxListKey = 'closures';
  static const String closuresBoxDropDownMapKey = 'dropDownMap';

  @override
  Future<void> initRepository() async {
    Hive.registerAdapter(ClosureAdapter());
    Hive.registerAdapter(ActDataAdapter());
    Hive.registerAdapter(FieldDataAdapter());
    Hive.registerAdapter(DocumentTypeAdapter());
    Hive.registerAdapter(DropDownMapDataAdapter());

    await Hive.openBox(closuresBoxName);

    final closures = Hive.box(closuresBoxName).get(closuresBoxListKey);
    if (closures == null) {
      Hive.box(closuresBoxName).put(closuresBoxListKey, []);
    }

    final dropDownMap =
        Hive.box(closuresBoxName).get(closuresBoxDropDownMapKey);
    if (dropDownMap == null) {
      Hive.box(closuresBoxName).put(
        closuresBoxDropDownMapKey,
        {
          'testName': const DropDownMapData(
            dependedFieldMapsMap: {
              'Первый': 'Хуервый',
              'Второй': 'Хуйрой',
              'Следующий': 'Хуедущий',
            },
            dropDownValuesMap: [
              'Первый',
              'Второй',
              'Следующий',
            ],
          )
        },
      );
    }
  }

  @override
  List<Closure> loadClosures() {
    return (Hive.box(closuresBoxName).get(closuresBoxListKey) as Iterable)
        .map((e) => e as Closure)
        .toList();
  }

  @override
  void saveClosures(List<Closure> closureList) {
    Hive.box(closuresBoxName).put(closuresBoxListKey, closureList);
  }

  @override
  void saveClosure(Closure closure) {
    final closures = loadClosures();
    int indexOfChanged =
        closures.indexWhere((element) => element.id == closure.id);
    if (indexOfChanged != -1) {
      final newClosures = List<Closure>.from(closures)
        ..[indexOfChanged] = closure;
      saveClosures(newClosures);
    }
  }

  @override
  void saveChangedAct(int idClosure, ActData act) {
    final closures = loadClosures();
    final indexOfChangedClosure =
        closures.indexWhere((element) => element.id == idClosure);
    final changedClosure = closures[indexOfChangedClosure];

    List<Closure> newClosures;
    if (act.type == DocumentType.commonInfo) {
      newClosures = List<Closure>.from(closures)
        ..[indexOfChangedClosure] = changedClosure.copyWith(commonInfo: act);
    } else {
      int indexOfChangedAct =
          changedClosure.acts.indexWhere((element) => element.id == act.id);
      newClosures = List<Closure>.from(closures)
        ..[indexOfChangedClosure] = changedClosure.copyWith(
          acts: List<ActData>.from(changedClosure.acts)
            ..[indexOfChangedAct] = act,
        );
    }
    saveClosures(newClosures);
  }

  @override
  Closure? loadClosure(int id) {
    final list =
        List<Closure>.from(Hive.box(closuresBoxName).get(closuresBoxListKey))
            .where((element) => element.id == id);
    return list.firstOrNull;
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
  Map<String, DropDownMapData> loadDropDownMap() {
    return (Hive.box(closuresBoxName).get(closuresBoxDropDownMapKey)
            as Map<dynamic, dynamic>)
        .map((key, value) => MapEntry(key, value));
  }

  @override
  void saveDropDownMap(Map<String, DropDownMapData> map) {
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
