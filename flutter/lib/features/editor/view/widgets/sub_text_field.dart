import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/field_data/field_data.dart';
import '../../editor_bloc/editor_bloc.dart';

class SpaceTextField extends StatefulWidget {
  const SpaceTextField({
    super.key,
    required this.index,
    required this.field,
  });

  final int index;
  final FieldData field;

  @override
  State<SpaceTextField> createState() => _SpaceTextFieldState();
}

class _SpaceTextFieldState extends State<SpaceTextField> {
  late TextEditingController textEditingController;
  late TextEditingController subTextEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController(text: widget.field.text);
    subTextEditingController = TextEditingController(
      text: widget.field.subText,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Focus(
            onFocusChange: (focus) => !focus
                ? context.read<EditorBloc>().add(
                      EditorEvent.editField(
                        fieldIndex: widget.index,
                        text: textEditingController.text,
                      ),
                    )
                : (),
            child: TextField(
              controller: textEditingController,
            ),
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Focus(
            onFocusChange: (focus) => !focus
                ? context.read<EditorBloc>().add(
                      EditorEvent.editSubField(
                        fieldIndex: widget.index,
                        subText: textEditingController.text,
                      ),
                    )
                : (),
            child: TextField(
              textAlign: TextAlign.right,
              controller: subTextEditingController,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    textEditingController.dispose();
    subTextEditingController.dispose();
    super.dispose();
  }
}
