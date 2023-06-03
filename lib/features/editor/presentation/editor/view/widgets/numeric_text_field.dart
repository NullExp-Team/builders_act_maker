import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/di.dart';
import '../../../../data/field_data/field_data.dart';
import '../../bloc/editor_cubit.dart';

class NumericTextField extends StatefulWidget {
  const NumericTextField({
    super.key,
    required this.index,
    required this.field,
    required this.mainWord,
  });

  final int index;
  final FieldData field;
  final String mainWord;

  @override
  State<NumericTextField> createState() => _NumericTextFieldState();
}

class _NumericTextFieldState extends State<NumericTextField> {
  late TextEditingController textEditingController;
  late FocusNode focusNode;
  @override
  void initState() {
    textEditingController = TextEditingController(text: widget.field.text);
    focusNode = FocusNode();
    focusNode.addListener(
      () => !focusNode.hasFocus
          ? context.read<EditorCubit>().changeNumericField(
                fieldIndex: widget.index,
                text: textEditingController.text,
                mainWord: widget.mainWord,
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
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: TextBox(
            focusNode: focusNode,
            controller: textEditingController,
            onSubmitted: (_) {
              focusNode.requestFocus();
              focusNode.nextFocus();
            },
          ),
        ),
        if (widget.field.subText != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(
              widget.field.subText!,
            ),
          ),
      ],
    );
  }
}
