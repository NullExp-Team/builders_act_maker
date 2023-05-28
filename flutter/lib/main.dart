import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di.dart';
import 'features/closure/presentation/closure_list_screen/cubit/closure_cubit.dart';
import 'features/closure/presentation/closure_list_screen/ui/closure_list_screen.dart';
import 'models/act_data/act_data.dart';
import 'models/closure/closure.dart';
import 'models/document_type/document_type.dart';
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

    final closure = Closure(
      id: 0,
      name: 'lol',
      path: 'kek',
      commonInfo: [
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
      ],
      acts: [
        ActData(
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
          ],
        ),
        ActData(
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

    return FluentApp(
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
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<ClosureCubit>(),
          ),
        ],
        child: const ClosureListScreen(),
      ),
    );
  }
}
