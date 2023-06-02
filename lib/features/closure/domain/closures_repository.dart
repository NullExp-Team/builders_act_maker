import 'package:flutter/foundation.dart';

import '../../editor/data/act_data/act_data.dart';
import '../../editor/data/drop_down_map_data/drop_down_map_data.dart';
import '../data/closure/closure.dart';

abstract class ClosuresRepository {
  Future<void> initRepository();

  void saveClosures(List<Closure> closures);

  List<Closure> loadClosures();

  Closure? loadClosure(int id);

  ActData loadAct(int idClosure, int idAct);

  void saveDropDownMap(Map<String, DropDownMapData> map);

  Map<String, DropDownMapData> loadDropDownMap();

  ValueListenable getClosureListenable();
}
