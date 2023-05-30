import '../../../models/act_data/act_data.dart';
import '../data/closure/closure.dart';

abstract class ClosuresRepository {
  Future<void> initRepository();

  void saveClosures(List<Closure> closures);

  List<Closure> loadClosures();

  Closure loadClosure(int id);

  ActData loadAct(int idClosure, int idAct);

  void saveDropDownMap(Map<String, List<String>> map);

  Map<String, List<String>> loadDropDownMap();
}
