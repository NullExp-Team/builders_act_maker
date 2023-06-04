import 'package:hive/hive.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'drop_down_map_data.freezed.dart';
part 'drop_down_map_data.g.dart';

@freezed
class DropDownMapData with _$DropDownMapData {
  @HiveType(typeId: 4)
  const factory DropDownMapData({
    @HiveField(0) @Default([]) List<String> dropDownValuesMap,
    @HiveField(1) @Default({}) Map<String, String> dependedFieldMapsMap,
  }) = _DropDownMapData;
}
