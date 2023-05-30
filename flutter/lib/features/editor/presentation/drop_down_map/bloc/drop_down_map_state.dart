part of 'drop_down_map_cubit.dart';

@freezed
sealed class DropDownMapState with _$DropDownMapState {
  const factory DropDownMapState.initial() = DropDownMapStateInitial;
  const factory DropDownMapState.loading() = DropDownMapStateLoading;
  const factory DropDownMapState.loaded({
    @Default({}) Map<String, DropDownMapData> dropDownMap,
  }) = DropDownMapStateLoaded;
}
