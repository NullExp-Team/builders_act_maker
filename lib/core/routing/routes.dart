import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

import '../../features/closure/presentation/closure_detail_screen/ui/closure_detail_screen.dart';
import '../../features/closure/presentation/closure_list_screen/ui/closure_list_screen.dart';
import '../../features/editor/presentation/editor/view/act_editor_screen.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(path: '/')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  String? redirect(BuildContext context, GoRouterState state) =>
      const ClosureListRoute().location;
}

@TypedGoRoute<ClosureListRoute>(
  path: '/closures',
  name: 'Список закрытий',
  routes: [
    TypedGoRoute<ClosureDetailRoute>(
      path: ':closureId',
      name: 'Закрытие',
      routes: [
        TypedGoRoute<ActEditorRoute>(
          path: ':actId',
          name: 'Акт',
        ),
      ],
    ),
  ],
)
class ClosureListRoute extends GoRouteData {
  const ClosureListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ClosureListScreen();
}

class ClosureDetailRoute extends GoRouteData {
  final int closureId;

  const ClosureDetailRoute({
    required this.closureId,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ClosureDetailScreen(closureId: closureId);
}

class ActEditorRoute extends GoRouteData {
  final int closureId;
  final int actId;

  const ActEditorRoute({
    required this.closureId,
    required this.actId,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      ActEditorScreen(closureId: closureId, actId: actId);
}
