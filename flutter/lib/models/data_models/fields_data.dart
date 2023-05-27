import 'package:freezed_annotation/freezed_annotation.dart';

part 'fields_data.freezed.dart';
part 'fields_data.g.dart';

@freezed
class FieldsData with _$FieldsData {
  factory FieldsData({
    required String text,
    required bool hasSpace,
    required String? subText,
  }) = _FieldsData;

  factory FieldsData.fromJson(Map<String, dynamic> json) =>
      _$FieldsDataFromJson(json);
}
