import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;

class EditableValueWidget extends StatefulWidget {
  final String value;
  final Function onEditButtonPress;
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
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
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
                  controller: controller,
                  style: TextStyle(fontSize: widget.textSize),
                ),
              )
            : Text(
                widget.value,
                style: TextStyle(fontSize: widget.textSize),
              ),
        const SizedBox(width: 30),
        Button(
          onPressed: () => widget.onEditButtonPress(controller.text),
          child: Icon(
            widget.isEditing ? m.Icons.save : m.Icons.edit,
          ),
        ),
      ],
    );
  }
}
