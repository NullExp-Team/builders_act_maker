import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../document_type_info/document_types_fields_info_container.dart';
import '../../../models/act_data/act_data.dart';
import '../../../models/field_types/field_types.dart';
import '../bloc/editor_bloc.dart';
import 'fields_list_widget.dart';

class EditorView extends StatefulWidget {
  final ActData actData;
  final int index;
  const EditorView({
    super.key,
    required this.actData,
    required this.index,
  });

  @override
  State<EditorView> createState() => _EditorViewState();
}

class _EditorViewState extends State<EditorView> {
  late final List<FieldType> fieldsTypes;

  @override
  void initState() {
    fieldsTypes = FieldTypeContainer.getFieldsTypes(widget.actData.type);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditorBloc(initAct: widget.actData),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.actData.name,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                // save
              },
              child: const Icon(
                Icons.check,
              ),
            ),
          ],
        ),
        body: FieldsList(fieldsTypes: fieldsTypes, actData: widget.actData),
      ),
    );
  }
}
