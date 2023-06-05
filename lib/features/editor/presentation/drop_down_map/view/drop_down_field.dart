import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di.dart';
import '../../../data/field_data/field_data.dart';
import '../bloc/drop_down_map_cubit.dart';
import '../../editor/bloc/editor_cubit.dart';

class DropDownField extends StatefulWidget {
  const DropDownField({
    super.key,
    required this.index,
    required this.field,
    required this.dependedMappedFields,
    required this.mapKey,
    this.placeholderNew,
    this.placeholderDepended,
  });

  final int index;
  final FieldData field;
  final List<int>? dependedMappedFields;
  final String mapKey;
  final String? placeholderNew;
  final String? placeholderDepended;

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  late final TextEditingController subController;
  late final TextEditingController firstController;
  late final TextEditingController secondController;
  late final FocusNode subFocusNode;
  late final FocusNode textFocusNode;
  late final FocusNode buttonFocusNode;
  @override
  void initState() {
    subController = TextEditingController();
    firstController = TextEditingController();
    secondController = TextEditingController();
    subFocusNode = FocusNode();
    textFocusNode = FocusNode();
    buttonFocusNode = FocusNode();

    subFocusNode.addListener(
      () => !subFocusNode.hasFocus
          ? context.read<EditorCubit>().changeSubField(
                fieldIndex: widget.index,
                subText: subController.text,
                isHasSpace: false,
              )
          : (),
    );
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
    const width = 250.0;
    return BlocProvider(
      create: (context) => DropDownMapCubit(repository: Di.get())..loadMap(),
      child: BlocBuilder<DropDownMapCubit, DropDownMapState>(
        builder: (context, state) {
          switch (state) {
            case DropDownMapStateLoaded():
              final bloc = context.read<DropDownMapCubit>();
              final editorBloc = context.read<EditorCubit>();
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

              final values =
                  state.dropDownMap[widget.mapKey]?.dropDownValuesMap ?? [];
              return Row(
                children: [
                  DropDownButton(
                    onOpen: () => buttonFocusNode.requestFocus(),
                    focusNode: buttonFocusNode,
                    title: Text(widget.field.text),
                    items: values
                        .map(
                          (e) => MenuFlyoutItem(
                            onPressed: () {
                              editorBloc.changeField(
                                fieldIndex: widget.index,
                                text: e,
                                dependedFields: widget.dependedMappedFields,
                                textForDependedFields: state
                                    .dropDownMap[widget.mapKey]
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
                          text: Row(
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
                                      placeholder: widget.placeholderNew ??
                                          'Новое значение',
                                      controller: firstController,
                                      onSubmitted: (text) =>
                                          textFocusNode.requestFocus(),
                                    ),
                                    TextBox(
                                      focusNode: textFocusNode,
                                      placeholder: widget.placeholderDepended ??
                                          'Соответствующее',
                                      controller: secondController,
                                      onSubmitted: (text) =>
                                          saveNewDropDownValue(),
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
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextBox(
                      focusNode: subFocusNode,
                      controller: subController,
                      onSubmitted: (_) {
                        subFocusNode.requestFocus();
                        subFocusNode.nextFocus();
                      },
                    ),
                  ),
                ],
              );
            default:
              return const ProgressRing();
          }
        },
      ),
    );
  }
}
