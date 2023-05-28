import 'dart:math';

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

  // random constructor
  factory FieldData.random() {
    final random = Random();
    final text = 'Поле ${random.nextInt(100)}';
    final hasSpace = random.nextBool();
    final subText = hasSpace ? 'Подполе ${random.nextInt(100)}' : null;

    return FieldData(
      text: text,
      hasSpace: hasSpace,
      subText: subText,
    );
  }
}
