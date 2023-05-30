import 'dart:math';

import 'package:hive/hive.dart';

import '../../features/editor/data/document_type/document_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../field_data/field_data.dart';

part 'act_data.freezed.dart';
part 'act_data.g.dart';

@freezed
class ActData with _$ActData {
  @HiveType(typeId: 1)
  const factory ActData({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required DocumentType type,
    @HiveField(3) @Default([]) List<FieldData> fields,
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

  factory ActData.test() {
    return ActData(
      id: 2,
      name: 'super',
      type: DocumentType.actOSR,
      fields: [
        FieldData(
          text: 'rar',
          hasSpace: false,
          subText: null,
        ),
        FieldData(
          text: 'tat',
          hasSpace: true,
          subText: 'hah',
        ),
        FieldData(
          text: 'tat',
          hasSpace: false,
          subText: 'hah',
        ),
        FieldData(
          text: 'tat',
          hasSpace: false,
          subText: 'hah',
        ),
        FieldData(
          text: 'tat',
          hasSpace: true,
          subText: 'hah',
        ),
      ],
    );
  }
}
