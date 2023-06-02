import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../../core/di.dart';
import '../../../../data/field_data/field_data.dart';
import '../../bloc/editor_cubit.dart';

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
  late FocusNode firstFocusNode;
  late FocusNode secondFocusNode;
  @override
  void initState() {
    final bloc = Di.get<EditorCubit>();
    textEditingController = TextEditingController(text: widget.field.text);
    subTextEditingController = TextEditingController(
      text: widget.field.subText,
    );
    firstFocusNode = FocusNode();
    secondFocusNode = FocusNode();
    firstFocusNode.addListener(
      () => !firstFocusNode.hasFocus
          ? bloc.changeField(
              fieldIndex: widget.index,
              text: textEditingController.text,
            )
          : (),
    );
    secondFocusNode.addListener(
      () => !secondFocusNode.hasFocus
          ? bloc.changeSubField(
              fieldIndex: widget.index,
              subText: subTextEditingController.text,
            )
          : (),
    );
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    subTextEditingController.dispose();
    firstFocusNode.dispose();
    secondFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Di.get<EditorCubit>();
    textEditingController.text = bloc.loadedState.act.fields[widget.index].text;
    subTextEditingController.text =
        bloc.loadedState.act.fields[widget.index].subText ?? '';
    return Row(
      children: [
        Expanded(
          child: TextBox(
            focusNode: firstFocusNode,
            controller: textEditingController,
            onSubmitted: (_) {
              firstFocusNode.requestFocus();
              firstFocusNode.nextFocus();
            },
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: TextBox(
            focusNode: secondFocusNode,
            textAlign: TextAlign.right,
            controller: subTextEditingController,
            onSubmitted: (_) {
              secondFocusNode.requestFocus();
              secondFocusNode.nextFocus();
            },
          ),
        ),
      ],
    );
  }
}
