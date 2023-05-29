import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/field_data/field_data.dart';
import '../../drop_down_map_cubit/drop_down_map_cubit.dart';
import '../../editor_bloc/editor_bloc.dart';

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
    switch (state) {
      case DropDownMapStateLoaded():
        final values = state.dropDownValuesMap[mapKey] ?? [];
        return Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<String>(
            tooltip: '',
            child: SizedBox(
              width: Size.infinite.width,
              child: Text(field.text),
            ),
            onSelected: (item) => context.read<EditorBloc>().add(
                  EditorEvent.editField(
                    fieldIndex: index,
                    text: item,
                    dependedFields: dependedMappedFields,
                    textForDependedFields: state.dependedFieldMapsMap[mapKey]
                        ?[item],
                  ),
                ),
            itemBuilder: (BuildContext context) => values
                .map(
                  (e) => PopupMenuItem<String>(
                    value: e,
                    child: Row(
                      children: [
                        Text(e),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context, field.text);
                            bloc.deleteValue(mapKey, e);
                          },
                          icon: const Icon(Icons.delete),
                        )
                      ],
                    ),
                  ),
                )
                .toList()
              ..add(
                PopupMenuItem<String>(
                  value: '',
                  enabled: false,
                  child: Builder(
                    builder: (context) {
                      final controller = TextEditingController();
                      return Row(
                        children: [
                          SizedBox(
                            width: 150,
                            child: TextField(
                              decoration: const InputDecoration(
                                hintText: 'Новый параметр',
                              ),
                              controller: controller,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context, controller.text);
                              bloc.saveNewValue(mapKey, controller.text);
                            },
                            icon: const Icon(Icons.add),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
          ),
        );
      default:
        return const CircularProgressIndicator();
    }
  }
}
