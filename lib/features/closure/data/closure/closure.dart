import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../editor/data/act_data/act_data.dart';

part 'closure.freezed.dart';
part 'closure.g.dart';

@freezed
class Closure with _$Closure {
  @HiveType(typeId: 0)
  factory Closure({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required String path,
    @HiveField(3) @Default(<ActData>[]) List<ActData> acts,
    @HiveField(4) required ActData commonInfo,
  }) = _Closure;

  factory Closure.fromJson(Map<String, dynamic> json) =>
      _$ClosureFromJson(json);

  factory Closure.newClosure(int id) => ClosureFactory.newClosure(id);
}

extension ClosureFactory on Closure {
  static Closure newClosure(int id) {
    return Closure(
      id: id,
      name: 'Закрытие $id',
      path: 'path',
      commonInfo: ActData.commonInfo(),
      acts: [],
    );
  }
}
