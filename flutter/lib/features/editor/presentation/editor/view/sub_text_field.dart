import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di.dart';
import '../../../../../models/field_data/field_data.dart';
import '../bloc/editor_bloc.dart';

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
  void dispose() {
    textEditingController.dispose();
    subTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Focus(
            onFocusChange: (focus) => !focus
                ? Di.get<EditorBloc>().add(
                    EditorEvent.editField(
                      fieldIndex: widget.index,
                      text: textEditingController.text,
                    ),
                  )
                : (),
            child: TextBox(
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
                ? Di.get<EditorBloc>().add(
                    EditorEvent.editSubField(
                      fieldIndex: widget.index,
                      subText: textEditingController.text,
                    ),
                  )
                : (),
            child: TextBox(
              textAlign: TextAlign.right,
              controller: subTextEditingController,
            ),
          ),
        ),
      ],
    );
  }
}
