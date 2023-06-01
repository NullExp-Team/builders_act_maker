import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../../core/di.dart';
import '../../../../../../models/field_data/field_data.dart';
import '../../bloc/editor_cubit.dart';

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
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Di.get<EditorCubit>();
    textEditingController.text = bloc.loadedState.act.fields[widget.index].text;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Focus(
          onFocusChange: (focus) => !focus
              ? bloc.changeField(
                  fieldIndex: widget.index,
                  text: textEditingController.text,
                  dependedFields: widget.dependedFields,
                )
              : (),
          child: TextBox(
            controller: textEditingController,
          ),
        ),
        if (widget.field.subText != null)
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                widget.field.subText!,
              ),
            ),
          ),
      ],
    );
  }
}
