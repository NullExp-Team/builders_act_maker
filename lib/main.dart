import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'core/di.dart';
import 'features/closure/presentation/closure_list_screen/cubit/closure_list_cubit.dart';

void main() async {
  await Di.initialize();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Colors.blue;

    final goRouter = Di.get<GoRouter>();

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
            create: (context) =>
                ClosureListCubit(goRouter: Di.get(), repository: Di.get()),
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
