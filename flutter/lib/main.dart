import 'package:fluent_ui/fluent_ui.dart';

import 'features/closure/presentation/closure_list_screen/ui/closure_list_screen.dart';
import 'models/document_type/document_type.dart';

import 'models/act_data/act_data.dart';
import 'models/field_data/field_data.dart';

void main() {
  final a = ActData(
    name: 'da',
    fields: [FieldData(text: ' ', hasSpace: false, subText: null)],
    type: DocumentType.actOSR,
  );
  final b = a.toJson;
  print(a.toJson().toString());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Colors.blue;

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
      home: const ClosureListScreen(),
    );
  }
}
