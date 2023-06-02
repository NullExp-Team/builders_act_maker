import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;

import 'message_box_button.dart';

class EditableValueWidget extends StatefulWidget {
  final String value;
  final bool Function(String) onEditButtonPress;
  final bool isEditing;
  final double textSize;
  const EditableValueWidget({
    super.key,
    required this.value,
    required this.onEditButtonPress,
    required this.isEditing,
    required this.textSize,
  });

  @override
  State<EditableValueWidget> createState() => _EditableValueWidgetState();
}

class _EditableValueWidgetState extends State<EditableValueWidget> {
  late final TextEditingController controller;
  late final FocusNode focusNode;
  @override
  void initState() {
    controller = TextEditingController();
    focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.text = widget.value;
    return Row(
      children: [
        widget.isEditing
            ? SizedBox(
                width: 400,
                child: TextBox(
                  focusNode: focusNode,
                  controller: controller,
                  style: TextStyle(fontSize: widget.textSize),
                ),
              )
            : Text(
                widget.value,
                style: TextStyle(fontSize: widget.textSize),
              ),
        const SizedBox(width: 30),
        MessageBoxButton(
          failureMessage: 'Такое имя акта уже есть',
          callBack: () {
            if (!widget.isEditing) focusNode.requestFocus();
            bool isSuccess = widget.onEditButtonPress(controller.text);
            return isSuccess;
          },
          child: Icon(
            widget.isEditing ? m.Icons.save : m.Icons.edit,
          ),
        ),
      ],
    );
  }
}
