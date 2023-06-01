import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;

import '../../../../../core/di.dart';
import '../../../../../models/field_data/field_data.dart';
import '../bloc/drop_down_map_cubit.dart';
import '../../editor/bloc/editor_cubit.dart';

class DropDownField extends StatefulWidget {
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
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  late final TextEditingController firstController;
  late final TextEditingController secondController;
  late final FocusNode textFocusNode;
  late final FocusNode buttonFocusNode;
  @override
  void initState() {
    firstController = TextEditingController();
    secondController = TextEditingController();
    textFocusNode = FocusNode();
    buttonFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    firstController.dispose();
    secondController.dispose();
    textFocusNode.dispose();
    buttonFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Di.get<DropDownMapCubit>();
    final state = bloc.state;
    const width = 250.0;
    final editorBloc = Di.get<EditorCubit>();

    saveNewDropDownValue() {
      bloc.saveNewValue(
        widget.mapKey,
        firstController.text,
        secondController.text,
      );
      editorBloc.changeField(
        fieldIndex: widget.index,
        text: firstController.text,
        dependedFields: widget.dependedMappedFields,
        textForDependedFields: secondController.text,
      );
      Navigator.pop(context);
    }

    switch (state) {
      case DropDownMapStateLoaded():
        final values =
            state.dropDownMap[widget.mapKey]?.dropDownValuesMap ?? [];
        return Align(
          alignment: Alignment.topLeft,
          child: DropDownButton(
            onOpen: () => buttonFocusNode.requestFocus(),
            focusNode: buttonFocusNode,
            title: Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.field.text),
            ),
            items: values
                .map(
                  (e) => MenuFlyoutItem(
                    onPressed: () {
                      editorBloc.changeField(
                        fieldIndex: widget.index,
                        text: e,
                        dependedFields: widget.dependedMappedFields,
                        textForDependedFields: state.dropDownMap[widget.mapKey]
                            ?.dependedFieldMapsMap[e],
                      );
                      buttonFocusNode.nextFocus();
                    },
                    text: Row(
                      children: [
                        Text(e),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context, widget.field.text);
                            bloc.deleteValue(widget.mapKey, e);
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
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - width / 2 <
                                  200
                              ? 200
                              : MediaQuery.of(context).size.width - width / 2,
                          child: Column(
                            children: [
                              TextBox(
                                placeholder: 'Новое значение',
                                controller: firstController,
                                onSubmitted: (text) =>
                                    textFocusNode.requestFocus(),
                              ),
                              TextBox(
                                focusNode: textFocusNode,
                                placeholder: 'Соответствующее',
                                controller: secondController,
                                onSubmitted: (text) => saveNewDropDownValue(),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () => saveNewDropDownValue(),
                          icon: const Icon(m.Icons.add),
                        ),
                      ],
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
