import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drop_down_map_state.dart';
part 'drop_down_map_cubit.freezed.dart';

class DropDownMapCubit extends Cubit<DropDownMapState> {
  DropDownMapCubit() : super(const DropDownMapState.initial());

  Future<void> loadMap() async {
    emit(DropDownMapState.loading());
    //загрузка из репозитория
    await Future.delayed(Duration(seconds: 1));
    final list = {
      'testName': [
        'Первый',
        'Второй',
        'Следующий',
      ]
    };
    final map = {
      'testName': {
        'Первый': 'Хуервый',
        'Второй': 'Хуйрой',
        'Следующий': 'Хуедущий',
      }
    };

    emit(
      DropDownMapState.loaded(
        dropDownValuesMap: list,
        dependedFieldMapsMap: map,
      ),
    );
  }

  Future<void> saveNewValue(String key, String value) async {
    await Future.delayed(Duration(seconds: 1));
    loadMap();
  }

  Future<void> deleteValue(String key, String value) async {
    await Future.delayed(Duration(seconds: 1));
    loadMap();
  }
}
