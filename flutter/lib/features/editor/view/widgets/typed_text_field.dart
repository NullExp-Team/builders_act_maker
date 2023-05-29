import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/field_data/field_data.dart';
import '../../editor_bloc/editor_bloc.dart';

class TypedTextField extends StatefulWidget {
  const TypedTextField({
    super.key,
    required this.index,
    required this.field,
    required this.dependedFields,
  });

  final int index;
  final FieldData field;
  final List<int>? dependedFields;

  @override
  State<TypedTextField> createState() => _TypedTextFieldState();
}

class _TypedTextFieldState extends State<TypedTextField> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController(text: widget.field.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.field.subText != null)
          Text(
            widget.field.subText!,
          ),
        Expanded(
          child: Focus(
            onFocusChange: (focus) => !focus
                ? context.read<EditorBloc>().add(
                      EditorEvent.editField(
                        fieldIndex: widget.index,
                        text: textEditingController.text,
                        dependedFields: widget.dependedFields,
                      ),
                    )
                : (),
            child: TextField(
              controller: textEditingController,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
}
