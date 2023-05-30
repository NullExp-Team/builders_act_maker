import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils.dart';
import '../../../../models/act_data/act_data.dart';

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

  factory Closure.random() => ClosureFactory.random();
}

extension ClosureFactory on Closure {
  // С hashCode хз, но всё на string переделывать лень
  // Хз как ещё с id норм работать, не юзаю uuid из блоков
  Closure newId() => copyWith(
        id: uuid.v4().hashCode,
        acts: acts.map((e) => e.newId()).toList(),
        commonInfo: commonInfo.newId(),
      );

  static Closure random() {
    final random = Random();
    final id = uuid.v4().hashCode;
    final name = 'Closure $id';
    final path = 'Path $id';
    final acts = List.generate(
      random.nextInt(10),
      (index) => ActData.random(),
    );
    final commonInfo = ActData.random();

    return Closure(
      id: id,
      name: name,
      path: path,
      acts: acts,
      commonInfo: commonInfo,
    );
  }
}
