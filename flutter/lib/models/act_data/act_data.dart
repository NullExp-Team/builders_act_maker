import 'package:builders_act_maker/models/document_type/document_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../field_data/field_data.dart';

part 'act_data.freezed.dart';
part 'act_data.g.dart';

@freezed
class ActData with _$ActData {
  factory ActData({
    required String name,
    required DocumentType type,
    @Default([]) List<FieldData> fields,
  }) = _ActData;

  factory ActData.fromJson(Map<String, dynamic> json) =>
      _$ActDataFromJson(json);
}
