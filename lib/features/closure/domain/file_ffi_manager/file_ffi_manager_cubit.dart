import 'dart:convert';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:ffi/ffi.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/closure/closure.dart';

part 'file_ffi_manager_state.dart';
part 'file_ffi_manager_cubit.freezed.dart';

typedef Cfunc = Pointer<Utf8> Function(Pointer<Utf8>);
typedef Dartfunc = Pointer<Utf8> Function(Pointer<Utf8>);

class FileFfiManagerCubit extends Cubit<FileFfiManagerState> {
  FileFfiManagerCubit() : super(const FileFfiManagerState.loaded());
  static const String _pathToDll = 'plugin\\act_builder_lib\\ActBuilder.dll';

  Future<String?> choosePath() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    return selectedDirectory;
  }

  bool openFile(Closure closure) {
    final filePath = '${closure.path}\\${closure.name}.xlsx';
    final lib = DynamicLibrary.open(_pathToDll);
    Pointer<NativeFunction<Cfunc>> cFunc =
        lib.lookup<NativeFunction<Cfunc>>('openFile');
    Dartfunc dartFunc = cFunc.asFunction<Dartfunc>();

    final result = dartFunc(filePath.toNativeUtf8());
    if (result.toDartString() == "0") {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> makeFile(Closure closure) async {
    try {
      final lib = DynamicLibrary.open(_pathToDll);
      Pointer<NativeFunction<Cfunc>> cFunc =
          lib.lookup<NativeFunction<Cfunc>>('makeFile');
      Dartfunc dartFunc = cFunc.asFunction<Dartfunc>();

      final strText = json.encode(closure.toJson());
      final pointer = strText.toNativeUtf8();
      final result = dartFunc(pointer);
      if (result.toDartString() == '0') {
        return true;
      } else {
        if (kDebugMode) {
          print(result.toDartString());
        }
        return false;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }
}
