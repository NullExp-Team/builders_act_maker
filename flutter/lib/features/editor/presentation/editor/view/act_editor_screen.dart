import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di.dart';
import '../../../../../core/widgets/navigation_header.dart';
import '../../../data/field_type_container/document_types_fields_info_container.dart';
import '../../drop_down_map/bloc/drop_down_map_cubit.dart';
import '../bloc/editor_cubit.dart';
import 'fields_list_widget.dart';

class ActEditorScreen extends StatefulWidget {
  final int actId;
  final int closureId;

  const ActEditorScreen({
    super.key,
    required this.closureId,
    required this.actId,
  });

  @override
  State<ActEditorScreen> createState() => _ActEditorScreenState();
}

class _ActEditorScreenState extends State<ActEditorScreen> {
  @override
  Widget build(BuildContext context) {
    final goRouter = Di.get<GoRouter>();
    final routes = goRouter.routerDelegate.currentConfiguration.matches
        .map((e) => e.route as GoRoute)
        .toList();

    final dropDownCubit = Di.get<DropDownMapCubit>()..loadMap();
    final editorCubit = Di.get<EditorCubit>()
      ..onInit(widget.closureId, widget.actId);
    return ScaffoldPage(
      header: NavigationHeader(routes: routes),
      content: Column(
        children: [
          Button(
            child: const Text('Сохранить'),
            onPressed: () {
              Di.get<EditorCubit>().onSave();
              goRouter.pop();
            },
          ),
          BlocBuilder<DropDownMapCubit, DropDownMapState>(
            bloc: dropDownCubit,
            builder: (context, state) {
              return BlocBuilder<EditorCubit, EditorState>(
                bloc: editorCubit,
                builder: (context, state) {
                  if (state is EditorStateLoaded) {
                    final actData = state.act;
                    return FieldsList(
                      fieldsTypes:
                          FieldTypeContainer.getFieldsTypes(actData.type),
                      fieldsNames:
                          FieldTypeContainer.getFieldsNames(actData.type),
                    );
                  } else {
                    return const ProgressRing();
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
