import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/document_types_fields_info_container.dart';
import '../../../models/act_data/act_data.dart';
import '../editor_bloc/editor_bloc.dart';
import 'widgets/fields_list_widget.dart';

class EditorView extends StatefulWidget {
  final ActData actData;
  final int? index;
  const EditorView({
    super.key,
    required this.actData,
    this.index,
  });

  @override
  State<EditorView> createState() => _EditorViewState();
}

class _EditorViewState extends State<EditorView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditorBloc(initAct: widget.actData),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.actData
                .name, // TODO Вообще не понимаю почему title тупо не появляется
            style: const TextStyle(
              fontSize: 32,
              color: Colors.black,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.red,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                context.read<EditorBloc>().add(EditorEvent.save(widget.index));
              },
              child: const Icon(
                Icons.check,
                color: Colors.red,
              ),
            ),
          ],
        ),
        body: FieldsList(
          fieldsTypes: FieldTypeContainer.getFieldsTypes(widget.actData.type),
          fieldsNames: FieldTypeContainer.getFieldsNames(widget.actData.type),
        ),
      ),
    );
  }
}
