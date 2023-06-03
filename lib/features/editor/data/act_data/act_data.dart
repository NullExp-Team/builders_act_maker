import 'package:hive/hive.dart';

import '../../../../core/utils.dart';
import '../document_type/document_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../document_types_fields_info_container/document_types_fields_info_container.dart';
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

  factory ActData.create(DocumentType type, int newIndex) =>
      ActDataFactory.create(type, newIndex);

  factory ActData.commonInfo() => ActDataFactory.commonInfo();
}

extension ActDataFactory on ActData {
  static ActData commonInfo() => ActData(
        id: -1,
        name: 'Общая информация',
        type: DocumentType.commonInfo,
        fields: List.filled(
          FieldTypeContainer.getFieldsMetaData(DocumentType.commonInfo).length,
          FieldData.empty(),
        ),
      );

  static ActData create(DocumentType type, int newIndex) => ActData(
        id: newIndex,
        name: 'Новый ${type.label.decapitalize()} $newIndex',
        type: type,
        fields: List.filled(
          FieldTypeContainer.getFieldsMetaData(type).length,
          FieldData.empty(),
        ),
      );
}
