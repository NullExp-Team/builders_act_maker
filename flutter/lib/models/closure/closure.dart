import 'package:freezed_annotation/freezed_annotation.dart';

import '../act_data/act_data.dart';
import '../field_data/field_data.dart';

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
}
