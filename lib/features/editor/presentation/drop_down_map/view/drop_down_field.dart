import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;

import '../../../../../core/di.dart';
import '../../../../../models/field_data/field_data.dart';
import '../bloc/drop_down_map_cubit.dart';
import '../../editor/bloc/editor_cubit.dart';

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
    final bloc = Di.get<DropDownMapCubit>();
    final state = bloc.state;
    const width = 250.0;

    switch (state) {
      case DropDownMapStateLoaded():
        saveFunction(text) => Di.get<EditorCubit>().changeField(
              fieldIndex: index,
              text: text,
              dependedFields: dependedMappedFields,
              textForDependedFields:
                  state.dropDownMap[mapKey]?.dependedFieldMapsMap[text],
            );
        final values = state.dropDownMap[mapKey]?.dropDownValuesMap ?? [];
        return Align(
          alignment: Alignment.topLeft,
          child: DropDownButton(
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(field.text),
            ),
            items: values
                .map(
                  (e) => MenuFlyoutItem(
                    onPressed: () => saveFunction(e),
                    text: Row(
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
                              width: MediaQuery.of(context).size.width -
                                          width / 2 <
                                      200
                                  ? 200
                                  : MediaQuery.of(context).size.width -
                                      width / 2,
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
                            ),
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
