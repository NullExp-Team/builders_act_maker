import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:ffi/ffi.dart';
import 'package:file_picker/file_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/closure/closure.dart';

part 'file_ffi_manager_state.dart';
part 'file_ffi_manager_cubit.freezed.dart';

typedef Cfunc = Int32 Function(Pointer<Utf8>);
typedef Dartfunc = int Function(Pointer<Utf8>);

class FileFfiManagerCubit extends Cubit<FileFfiManagerState> {
  FileFfiManagerCubit() : super(const FileFfiManagerState.loaded());
  static const String _pathToDll =
      '../bin/debug/net6.0/win-x64/publish/NativeLibrary.dll';

  Future<String?> choosePath() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();
    return selectedDirectory;
  }

  int openFile(Closure closure) {
    final filePath = '${closure.path}${closure.name}.xlsx';
    final lib = DynamicLibrary.open(_pathToDll);
    Pointer<NativeFunction<Cfunc>> cFunc =
        lib.lookup<NativeFunction<Cfunc>>('openFile');
    Dartfunc dartFunc = cFunc.asFunction<Dartfunc>();

    final result = dartFunc(filePath.toNativeUtf8());
    if (result == 0) {
      //norm;
      return 0;
    } else {
      //error
      return -1;
    }
  }

  Future<int> makeFile(Closure closure) async {
    final lib = DynamicLibrary.open(_pathToDll);
    Pointer<NativeFunction<Cfunc>> cFunc =
        lib.lookup<NativeFunction<Cfunc>>('makeFile');
    Dartfunc dartFunc = cFunc.asFunction<Dartfunc>();

    final result = dartFunc(closure.toJson().toString().toNativeUtf8());
    if (result == 0) {
      //norm;
      return 0;
    } else {
      //error
      return -1;
    }
  }
}
