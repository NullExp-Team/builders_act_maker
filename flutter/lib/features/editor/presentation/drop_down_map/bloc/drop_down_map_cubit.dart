import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../closure/domain/closures_repository.dart';
import '../../../data/drop_down_map_data/drop_down_map_data.dart';

part 'drop_down_map_state.dart';
part 'drop_down_map_cubit.freezed.dart';

class DropDownMapCubit extends Cubit<DropDownMapState> {
  final ClosuresRepository repository;
  DropDownMapCubit({required this.repository})
      : super(const DropDownMapState.initial());

  DropDownMapStateLoaded get loadedState => state as DropDownMapStateLoaded;

  void loadMap() {
    final data = repository.loadDropDownMap();

    emit(
      DropDownMapState.loaded(
        dropDownMap: data,
      ),
    );
  }

  void saveNewValue(String key, String value, String mapedValue) {
    final data = loadedState.dropDownMap[key]!.copyWith(
      dependedFieldMapsMap:
          Map.from(loadedState.dropDownMap[key]!.dependedFieldMapsMap)
            ..[value] = mapedValue,
      dropDownValuesMap:
          List.from(loadedState.dropDownMap[key]!.dropDownValuesMap)
            ..add(value),
    );
    emit(
      loadedState.copyWith(
        dropDownMap: Map.from(loadedState.dropDownMap)..[key] = data,
      ),
    );
    repository.saveDropDownMap(loadedState.dropDownMap);
  }

  void deleteValue(String key, String value) {
    final data = loadedState.dropDownMap[key]!.copyWith(
      dependedFieldMapsMap:
          Map.from(loadedState.dropDownMap[key]!.dependedFieldMapsMap)
            ..remove(value),
      dropDownValuesMap:
          List.from(loadedState.dropDownMap[key]!.dropDownValuesMap)
            ..remove(value),
    );
    emit(
      loadedState.copyWith(
        dropDownMap: Map.from(loadedState.dropDownMap)..[key] = data,
      ),
    );
    repository.saveDropDownMap(loadedState.dropDownMap);
  }
}
