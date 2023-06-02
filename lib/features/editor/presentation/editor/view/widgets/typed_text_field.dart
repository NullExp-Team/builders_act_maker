import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../../core/di.dart';
import '../../../../data/field_data/field_data.dart';
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
  late FocusNode focusNode;
  @override
  void initState() {
    textEditingController = TextEditingController(text: widget.field.text);
    focusNode = FocusNode();
    focusNode.addListener(
      () => !focusNode.hasFocus
          ? Di.get<EditorCubit>().changeField(
              fieldIndex: widget.index,
              text: textEditingController.text,
              dependedFields: widget.dependedFields,
            )
          : (),
    );
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    textEditingController.text = widget.field.text;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextBox(
          focusNode: focusNode,
          controller: textEditingController,
          onSubmitted: (_) {
            // из-за того, что в результате нажатия enter мы вначале теряем фокус, а после выполняем
            // onSubmitted, то nextFocus() переключает фокус на первый элемент последнего FocusScope
            // чтобы избежать этого - вновь запрашиваем фокус
            focusNode.requestFocus();
            focusNode.nextFocus();
          },
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
