import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils.dart';
import '../../../../models/act_data/act_data.dart';
import '../../../editor/data/document_type/document_type.dart';

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
