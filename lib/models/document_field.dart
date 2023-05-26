import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_field.freezed.dart';
part 'document_field.g.dart';

@freezed
sealed class DocumentField with _$DocumentField {
  factory DocumentField({
    required String key,
    required List<DocumentField> preFields,
  }) = _DocumentField;

  factory DocumentField.fromJson(Map<String, dynamic> json) =>
      _$DocumentFieldFromJson(json);
}
