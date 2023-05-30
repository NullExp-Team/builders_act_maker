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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) =>
              DropDownMapCubit(repository: Di.get())..loadMap(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => Di.get<EditorBloc>()
            ..add(EditorEvent.init(widget.closureId, widget.actId)),
        ),
      ],
      child: const EditorView(),
    );
  }
}

class EditorView extends StatelessWidget {
  const EditorView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              context.read<EditorBloc>().add(const EditorEvent.save());
            },
            child: const Icon(
              Icons.check,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: BlocBuilder<DropDownMapCubit, DropDownMapState>(
        builder: (context, state) {
          return BlocBuilder<EditorBloc, EditorState>(
            builder: (context, state) {
              if (state is EditorStateLoaded) {
                final actData = state.act;
                return FieldsList(
                  fieldsTypes: FieldTypeContainer.getFieldsTypes(actData.type),
                  fieldsNames: FieldTypeContainer.getFieldsNames(actData.type),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          );
        },
      ),
    );
  }
}
