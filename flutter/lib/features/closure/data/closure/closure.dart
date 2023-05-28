import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/act_data/act_data.dart';
import '../../../../models/field_data/field_data.dart';

part 'closure.freezed.dart';
part 'closure.g.dart';

@freezed
class Closure with _$Closure {
  factory Closure({
    required int id,
    required String name,
    required String path,
    @Default(<ActData>[]) List<ActData> acts,
    @Default(<FieldData>[]) List<FieldData> commonInfo,
  }) = _Closure;

  factory Closure.fromJson(Map<String, dynamic> json) =>
      _$ClosureFromJson(json);

  // random constructor
  factory Closure.random() {
    final random = Random();
    final id = random.nextInt(100);
    final name = 'Закрытие $id';
    final path = 'Путь $id';
    final acts = List.generate(
      random.nextInt(10),
      (index) => ActData.random(),
    );
    final commonInfo = List.generate(
      random.nextInt(10),
      (index) => FieldData.random(),
    );

    return Closure(
      id: id,
      name: name,
      path: path,
      acts: acts,
      commonInfo: commonInfo,
    );
  }
}
