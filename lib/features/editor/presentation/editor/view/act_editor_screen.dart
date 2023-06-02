import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di.dart';
import '../../../../../core/widgets/navigation_header.dart';
import '../../../data/document_types_fields_info_container/document_types_fields_info_container.dart';
import '../../drop_down_map/bloc/drop_down_map_cubit.dart';
import '../bloc/editor_cubit.dart';
import '../../../../../core/widgets/editable_value_widget.dart';
import 'widgets/fields_list_widget.dart';

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
      ..init(widget.closureId, widget.actId);
    return ScaffoldPage(
      header: NavigationHeader(
        routes: routes,
        isDataHasChanges: () =>
            editorCubit.isActHasChanges(widget.closureId, widget.actId),
      ),
      content: BlocBuilder<DropDownMapCubit, DropDownMapState>(
        bloc: dropDownCubit,
        builder: (context, state) {
          return BlocBuilder<EditorCubit, EditorState>(
            bloc: editorCubit,
            builder: (context, state) {
              if (state is EditorStateLoaded) {
                final actData = state.act;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          EditableValueWidget(
                            value: actData.name,
                            isEditing: state.isNameEditing,
                            onEditButtonPress: (newName) => editorCubit
                                .onNameEdit(newName, widget.closureId),
                            textSize: 32,
                          ),
                          const Spacer(),
                          Button(
                            child: const Text('Сохранить изменения'),
                            onPressed: () {
                              Di.get<EditorCubit>().save();
                              goRouter.pop();
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: FieldsList(
                        fieldsTypes:
                            FieldTypeContainer.getFieldsTypes(actData.type),
                        fieldsNames:
                            FieldTypeContainer.getFieldsNames(actData.type),
                      ),
                    ),
                  ],
                );
              } else {
                return const ProgressRing();
              }
            },
          );
        },
      ),
    );
  }
}
