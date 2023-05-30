import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di.dart';
import '../../../../../core/widgets/navigation_header.dart';
import '../../../data/field_type_container/document_types_fields_info_container.dart';
import '../../drop_down_map/bloc/drop_down_map_cubit.dart';
import '../bloc/editor_bloc.dart';
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
    final goRouter = Di.get<GoRouter>();
    final routes = goRouter.routerDelegate.currentConfiguration.matches
        .map((e) => e.route as GoRoute)
        .toList();

    return ScaffoldPage(
      header: NavigationHeader(routes: routes),
      content: Column(
        children: [
          Button(
            child: const Text('Сохранить'),
            onPressed: () =>
                context.read<EditorBloc>().add(const EditorEvent.save()),
          ),
          BlocBuilder<DropDownMapCubit, DropDownMapState>(
            builder: (context, state) {
              return BlocBuilder<EditorBloc, EditorState>(
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
