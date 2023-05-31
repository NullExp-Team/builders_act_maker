import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/closure/closure.dart';

part 'file_ffi_manager_state.dart';
part 'file_ffi_manager_cubit.freezed.dart';

class FileFfiManagerCubit extends Cubit<FileFfiManagerState> {
  FileFfiManagerCubit() : super(const FileFfiManagerState.loaded());

  Future<String?> choosePath() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    return selectedDirectory;
  }

  void openFile() {
    //ffi
  }

  void makeFile(Closure closure) {
    // fffi
  }
}
