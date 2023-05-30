import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'core/di.dart';
import 'features/closure/presentation/closure_list_screen/cubit/closure_list_cubit.dart';
import 'models/act_data/act_data.dart';
import 'features/closure/data/closure/closure.dart';
import 'features/editor/data/document_type/document_type.dart';
import 'models/field_data/field_data.dart';

void main() {
  Di.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Colors.blue;

    final goRouter = Di.get<GoRouter>();

    final closure = Closure(
      id: 0,
      name: 'lol',
      path: 'kek',
      commonInfo: ActData(
        id: 1,
        name: 'Общая информация',
        type: DocumentType.commonInfo,
        fields: [
          FieldData(
            text: 'rar',
            hasSpace: true,
            subText: null,
          ),
          FieldData(
            text: 'tat',
            hasSpace: true,
            subText: 'hah',
          ),
          FieldData(
            text: 'rar',
            hasSpace: true,
            subText: null,
          ),
          FieldData(
            text: 'tat',
            hasSpace: true,
            subText: 'hah',
          ),
        ],
      ),
      acts: [
        ActData(
          id: 2,
          name: 'super',
          type: DocumentType.actOSR,
          fields: [
            FieldData(
              text: 'rar',
              hasSpace: false,
              subText: null,
            ),
            FieldData(
              text: 'tat',
              hasSpace: true,
              subText: 'hah',
            ),
            FieldData(
              text: 'tat',
              hasSpace: false,
              subText: 'hah',
            ),
            FieldData(
              text: 'tat',
              hasSpace: false,
              subText: 'hah',
            ),
            FieldData(
              text: 'tat',
              hasSpace: true,
              subText: 'hah',
            ),
          ],
        ),
        ActData(
          id: 3,
          name: 'repus',
          type: DocumentType.actOSR,
          fields: [
            FieldData(
              text: 'tat',
              hasSpace: false,
              subText: null,
            ),
            FieldData(
              text: 'rar',
              hasSpace: true,
              subText: 'hah',
            ),
          ],
        ),
      ],
    );

    return FluentApp.router(
      debugShowCheckedModeBanner: false,
      color: color,
      darkTheme: FluentThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[170],
        accentColor: color,
        visualDensity: VisualDensity.standard,
        focusTheme: FocusThemeData(
          glowFactor: is10footScreen(context) ? 2.0 : 0.0,
        ),
      ),
      theme: FluentThemeData(
        accentColor: color,
        scaffoldBackgroundColor: Colors.grey[30],
        visualDensity: VisualDensity.standard,
        focusTheme: FocusThemeData(
          glowFactor: is10footScreen(context) ? 2.0 : 0.0,
        ),
      ),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => Di.get<ClosureListCubit>(),
          ),
        ],
        child: child!,
      ),
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
    );
  }
}
