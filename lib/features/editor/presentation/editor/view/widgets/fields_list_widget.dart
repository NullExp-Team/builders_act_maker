import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/document_types_fields_info_container/document_types_fields_info_container.dart';
import '../../../../data/field_types/field_types.dart';
import '../../bloc/editor_cubit.dart';
import '../../../drop_down_map/view/drop_down_field.dart';
import 'multi_line_text_field.dart';
import 'numeric_text_field.dart';
import 'space_text_field.dart';
import 'typed_text_field.dart';

class FieldsList extends StatelessWidget {
  const FieldsList({
    super.key,
    required this.fieldsMetaData,
  });

  final List<FieldMetaData> fieldsMetaData;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      //для правильной работы фокуса нужно загружать на экран сразу все поля
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              for (int index = 0; index < fieldsMetaData.length; index++)
                Builder(
                  builder: (context) {
                    final field = context
                        .read<EditorCubit>()
                        .loadedState
                        .act
                        .fields[index];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (fieldsMetaData[index].type is! DuplicateFieldType)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                fieldsMetaData[index].name,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        switch (fieldsMetaData[index].type) {
                          TextFieldType(:final dependedFields) =>
                            TypedTextField(
                              index: index,
                              field: field,
                              dependedFields: dependedFields,
                            ),
                          DropDownFieldType(
                            :final name,
                            :final dependedMappedFields,
                            :final placeholderNew,
                            :final placeholderDepended,
                          ) =>
                            DropDownField(
                              index: index,
                              field: field,
                              dependedMappedFields: dependedMappedFields,
                              mapKey: name,
                              placeholderNew: placeholderNew,
                              placeholderDepended: placeholderDepended,
                            ),
                          SpaceTextFieldType() => SpaceTextField(
                              index: index,
                              field: field,
                            ),
                          NumericFieldType(:final mainWord) => NumericTextField(
                              index: index,
                              field: field,
                              mainWord: mainWord,
                            ),
                          MultiLineFieldType(:final isNeedNumireate) =>
                            MultiLineTextField(
                              index: index,
                              field: field,
                              isNeedNumireate: isNeedNumireate,
                            ),
                          DuplicateFieldType() => const SizedBox(),
                        },
                        if (fieldsMetaData[index].type is! DuplicateFieldType)
                          const SizedBox(height: 10),
                      ],
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
