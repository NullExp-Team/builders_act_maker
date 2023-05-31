import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../core/di.dart';
import '../../../data/field_types/field_types.dart';
import '../bloc/editor_bloc.dart';
import '../../drop_down_map/view/drop_down_field.dart';
import 'sub_text_field.dart';
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
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        final field = Di.get<EditorBloc>().loadedState.act.fields[index];
        return Column(
          children: [
            if (fieldsTypes[index] is! DuplicateFieldType)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    fieldsNames[index],
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            switch (fieldsTypes[index]) {
              TextFieldType(:final dependedFields) => TypedTextField(
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
              DuplicateFieldType() => const SizedBox(),
            }
          ],
        );
      },
      separatorBuilder: (context, index) =>
          fieldsTypes[index] is DuplicateFieldType
              ? const SizedBox()
              : const SizedBox(
                  height: 15,
                ),
      itemCount: fieldsTypes.length,
    );
  }
}
