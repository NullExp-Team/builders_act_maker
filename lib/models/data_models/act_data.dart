import 'package:builders_act_maker/models/data_models/fields_data.dart';
import 'package:builders_act_maker/models/type_models/document_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'act_data.freezed.dart';
part 'act_data.g.dart';

@freezed
class ActData with _$ActData {
  factory ActData({
    required String name,
    required DocumentType type,
    @Default([]) List<FieldsData> fields,
  }) = _ActData;

  factory ActData.fromJson(Map<String, dynamic> json) =>
      _$ActDataFromJson(json);
}
