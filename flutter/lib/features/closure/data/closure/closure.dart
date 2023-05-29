import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../models/act_data/act_data.dart';

part 'closure.freezed.dart';
part 'closure.g.dart';

@freezed
class Closure with _$Closure {
  factory Closure({
    required int id,
    required String name,
    required String path,
    @Default(<ActData>[]) List<ActData> acts,
    required ActData commonInfo,
  }) = _Closure;

  factory Closure.fromJson(Map<String, dynamic> json) =>
      _$ClosureFromJson(json);

  // great random constructor
  factory Closure.random() {
    final random = Random();
    final id = random.nextInt(1000);
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
