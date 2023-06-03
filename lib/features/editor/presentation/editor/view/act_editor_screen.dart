import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di.dart';
import '../../../../../core/widgets/navigation_header.dart';
import '../../../data/document_types_fields_info_container/document_types_fields_info_container.dart';
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

    return BlocProvider(
      create: (context) => EditorCubit(repository: Di.get())
        ..init(widget.closureId, widget.actId),
      child: BlocBuilder<EditorCubit, EditorState>(
        builder: (context, state) {
          final bloc = context.read<EditorCubit>();
          return ScaffoldPage(
              header: NavigationHeader(
                routes: routes,
                isDataHasChanges: () => context
                    .read<EditorCubit>()
                    .isActHasChanges(widget.closureId, widget.actId),
              ),
              content: state is EditorStateLoaded
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              EditableValueWidget(
                                value: state.act.name,
                                isEditing: state.isNameEditing,
                                onEditButtonPress: (newName) =>
                                    bloc.onNameEdit(newName, widget.closureId),
                                textSize: 32,
                              ),
                              const Spacer(),
                              Button(
                                child: const Text('Сохранить изменения'),
                                onPressed: () {
                                  bloc.save();
                                  goRouter.pop();
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: FieldsList(
                            fieldsTypes: FieldTypeContainer.getFieldsTypes(
                                state.act.type),
                            fieldsNames: FieldTypeContainer.getFieldsNames(
                                state.act.type),
                          ),
                        ),
                      ],
                    )
                  : const ProgressRing());
        },
      ),
    );
  }
}
