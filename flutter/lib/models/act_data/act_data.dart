import 'dart:math';

import '../../features/editor/data/document_type/document_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../field_data/field_data.dart';

part 'act_data.freezed.dart';
part 'act_data.g.dart';

@freezed
class ActData with _$ActData {
  const factory ActData({
    required int id,
    required String name,
    required DocumentType type,
    @Default([]) List<FieldData> fields,
  }) = _ActData;

  factory ActData.fromJson(Map<String, dynamic> json) =>
      _$ActDataFromJson(json);

  // random constructor
  factory ActData.random() {
    final random = Random();
    final name = 'Акт ${random.nextInt(100)}';
    final type =
        DocumentType.values[random.nextInt(DocumentType.values.length)];
    final fields = List.generate(
      random.nextInt(10),
      (index) => FieldData.random(),
    );

    return ActData(
      id: random.nextInt(1000),
      name: name,
      type: type,
      fields: fields,
    );
  }
}
