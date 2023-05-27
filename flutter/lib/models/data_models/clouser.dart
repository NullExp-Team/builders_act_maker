import 'package:builders_act_maker/models/data_models/act_data.dart';
import 'package:builders_act_maker/models/data_models/fields_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clouser.freezed.dart';
part 'clouser.g.dart';

@freezed
class Clouser with _$Clouser {
  factory Clouser({
    required int id,
    required String name,
    @Default(<ActData>[]) List<ActData> acts,
    @Default(<FieldsData>[]) List<FieldsData> commonInfo,
  }) = _Clouser;

  factory Clouser.fromJson(Map<String, dynamic> json) =>
      _$ClouserFromJson(json);
}
