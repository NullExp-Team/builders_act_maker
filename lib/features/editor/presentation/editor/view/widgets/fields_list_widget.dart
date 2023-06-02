import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../../core/di.dart';
import '../../../../data/field_types/field_types.dart';
import '../../bloc/editor_cubit.dart';
import '../../../drop_down_map/view/drop_down_field.dart';
import 'numeric_text_field.dart';
import 'space_text_field.dart';
import 'typed_text_field.dart';

class FieldsList extends StatelessWidget {
  const FieldsList({
    super.key,
    required this.fieldsTypes,
    required this.fieldsNames,
  });

  //получаем инфу о типах полей
  final List<FieldType> fieldsTypes;
  //получаем инфу о названиях полей
  final List<String> fieldsNames;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      //для правильной работы фокуса нужно загружать на экран сразу все поля
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              for (int index = 0; index < fieldsNames.length; index++)
                Builder(
                  builder: (context) {
                    final field =
                        Di.get<EditorCubit>().loadedState.act.fields[index];
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (fieldsTypes[index] is! DuplicateFieldType)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                fieldsNames[index],
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        switch (fieldsTypes[index]) {
                          TextFieldType(:final dependedFields) =>
                            TypedTextField(
                              index: index,
                              field: field,
                              dependedFields: dependedFields,
                            ),
                          DropDownFieldType(
                            :final name,
                            :final dependedMappedFields,
                          ) =>
                            DropDownField(
                              index: index,
                              field: field,
                              dependedMappedFields: dependedMappedFields,
                              mapKey: name,
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
                          DuplicateFieldType() => const SizedBox(),
                        },
                        if (fieldsTypes[index] is! DuplicateFieldType)
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
