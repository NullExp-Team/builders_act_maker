import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/field_types/field_types.dart';
import '../bloc/editor_bloc.dart';
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
    return BlocBuilder<EditorBloc, EditorState>(
      builder: (context, state) {
        if (state is EditorLoadedState) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final field = state.act.fields[index];
              return Column(
                children: [
                  if (fieldsTypes[index] is! DuplicateFieldType)
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        fieldsNames[index],
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  switch (fieldsTypes[index]) {
                    TextFieldType(dependedFields: var dependedFields) =>
                      TypedTextField(
                        index: index,
                        field: field,
                        dependedFields: dependedFields,
                      ),
                    DropDownFieldType(name: var name) => Align(
                        alignment: Alignment.topLeft,
                        child: DropdownButton(
                          isExpanded: true,
                          items: const [
                            DropdownMenuItem(
                              value: 1,
                              child: Text('1'),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text('2'),
                            ),
                            DropdownMenuItem(
                              value: 1,
                              child: Text('2'),
                            ),
                          ],
                          onChanged: (chosen) {
                            // по name получаем из общего блока все варианты
                            // TODO это будет реализовано, когда появится общий блок, что хранит эти данные
                          },
                        ),
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
        } else {
          // обработка ошибок и состояния загрузки. В целом, эти два состояния нигде не возникают, так что пока что
          // это мёртвый код. Нужно либо выпилить состояния, либо обработать
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
