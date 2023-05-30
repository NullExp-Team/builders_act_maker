import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di.dart';
import '../../../data/field_type_container/document_types_fields_info_container.dart';
import '../../drop_down_map/bloc/drop_down_map_cubit.dart';
import '../bloc/editor_bloc.dart';
import 'fields_list_widget.dart';

class EditorPage extends StatefulWidget {
  final int actId;
  final int closureId;
  const EditorPage({
    super.key,
    required this.closureId,
    required this.actId,
  });

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DropDownMapCubit()..loadMap(),
      child: BlocProvider(
        lazy: false,
        create: (context) => Di.get<EditorBloc>()
          ..add(EditorEvent.init(widget.closureId, widget.actId)),
        child: const EditorView(),
      ),
    );
  }
}

class EditorView extends StatelessWidget {
  const EditorView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final actData = (context.read<EditorBloc>().state as EditorStateLoaded).act;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          actData
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
              context.read<EditorBloc>().add(EditorEvent.save(actData.id));
            },
            child: const Icon(
              Icons.check,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: FieldsList(
        fieldsTypes: FieldTypeContainer.getFieldsTypes(actData.type),
        fieldsNames: FieldTypeContainer.getFieldsNames(actData.type),
      ),
    );
  }
}
