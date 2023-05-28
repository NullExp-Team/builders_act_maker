import 'package:freezed_annotation/freezed_annotation.dart';

part 'field_data.freezed.dart';
part 'field_data.g.dart';

@freezed
class FieldData with _$FieldData {
  factory FieldData({
    required String text,
    required bool hasSpace,
    required String? subText,
  }) = _FieldData;

  factory FieldData.fromJson(Map<String, dynamic> json) =>
      _$FieldDataFromJson(json);
}
