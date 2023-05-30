import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/field_data/field_data.dart';
import '../bloc/drop_down_map_cubit.dart';
import '../../editor/bloc/editor_bloc.dart';

class DropDownField extends StatelessWidget {
  const DropDownField({
    super.key,
    required this.index,
    required this.field,
    required this.dependedMappedFields,
    required this.mapKey,
  });

  final int index;
  final FieldData field;
  final List<int>? dependedMappedFields;
  final String mapKey;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DropDownMapCubit>();
    final state = bloc.state;
    const width = 250.0;

    switch (state) {
      case DropDownMapStateLoaded():
        saveFunction(text) => context.read<EditorBloc>().add(
              EditorEvent.editField(
                fieldIndex: index,
                text: text,
                dependedFields: dependedMappedFields,
                textForDependedFields:
                    state.dropDownMap[mapKey]?.dependedFieldMapsMap[text],
              ),
            );
        final values = state.dropDownMap[mapKey]?.dropDownValuesMap ?? [];
        return Align(
          alignment: Alignment.topLeft,
          child: DropDownButton(
            title: SizedBox(
              width: width,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(field.text),
              ),
            ),
            items: values
                .map(
                  (e) => MenuFlyoutItem(
                    onPressed: () => saveFunction(e),
                    text: SizedBox(
                      width: width,
                      child: Row(
                        children: [
                          Text(e),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context, field.text);
                              bloc.deleteValue(mapKey, e);
                            },
                            icon: const Icon(m.Icons.delete),
                          )
                        ],
                      ),
                    ),
                  ),
                )
                .toList()
              ..add(
                MenuFlyoutItem(
                  onPressed: () {},
                  text: SizedBox(
                    width: width,
                    child: Builder(
                      builder: (context) {
                        final firstController = TextEditingController();
                        final secondController = TextEditingController();
                        return Row(
                          children: [
                            SizedBox(
                              width: 210,
                              child: Column(
                                children: [
                                  TextBox(
                                    placeholder: 'Новое значение',
                                    controller: firstController,
                                  ),
                                  TextBox(
                                    placeholder: 'Соответствующее',
                                    controller: secondController,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                bloc.saveNewValue(
                                  mapKey,
                                  firstController.text,
                                  secondController.text,
                                );
                                saveFunction(firstController.text);
                                Navigator.pop(context);
                              },
                              icon: const Icon(m.Icons.add),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
          ),
        );
      default:
        return const ProgressRing();
    }
  }
}
