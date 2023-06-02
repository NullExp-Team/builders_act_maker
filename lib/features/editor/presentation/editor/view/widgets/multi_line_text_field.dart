import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../../core/di.dart';
import '../../../../data/field_data/field_data.dart';
import '../../bloc/editor_cubit.dart';

class MultiLineTextField extends StatefulWidget {
  const MultiLineTextField({
    super.key,
    required this.index,
    required this.field,
    required this.isNeedNumireate,
  });

  final int index;
  final FieldData field;
  final bool isNeedNumireate;

  @override
  State<MultiLineTextField> createState() => _MultiLineTextFieldState();
}

class _MultiLineTextFieldState extends State<MultiLineTextField> {
  late TextEditingController textEditingController;
  late FocusNode focusNode;
  @override
  void initState() {
    textEditingController = TextEditingController(text: widget.field.text);
    focusNode = FocusNode();
    focusNode.addListener(
      () => !focusNode.hasFocus
          ? Di.get<EditorCubit>().changeMultiLineField(
              fieldIndex: widget.index,
              text: textEditingController.text,
              isNeedNumireate: widget.isNeedNumireate,
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
          minLines: 2,
          maxLines: null,
          focusNode: focusNode,
          controller: textEditingController,
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
