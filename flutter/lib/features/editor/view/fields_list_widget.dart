import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/field_types/field_types.dart';
import '../bloc/editor_bloc.dart';

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
                    TextFieldType(dependedFields: var dependedFields) => Row(
                        children: [
                          if (field.subText != null)
                            Text(
                              field.subText!,
                            ),
                          Expanded(
                            child: TextField(
                              controller: TextEditingController(
                                text: field.text,
                              ),
                              onSubmitted: (text) {
                                context.read<EditorBloc>().add(
                                      EditorEvent.editField(
                                        fieldIndex: index,
                                        text: text,
                                        dependedFields: dependedFields,
                                      ),
                                    );
                              },
                            ),
                          ),
                        ],
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
                          },
                        ),
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
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
