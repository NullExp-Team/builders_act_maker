import 'package:go_router/go_router.dart';

import '../../../../../core/di.dart';
import '../../../../../core/widgets/navigation_header.dart';
import 'widgets/add_closure_card.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'widgets/closure_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import '../cubit/closure_list_cubit.dart';

class ClosureListScreen extends StatefulWidget {
  const ClosureListScreen({super.key});

  @override
  State<ClosureListScreen> createState() => _ClosureListScreenState();
}

class _ClosureListScreenState extends State<ClosureListScreen> {
  late final cubit = context.read<ClosureListCubit>();

  final goRouter = Di.get<GoRouter>();
  late final routes = goRouter.routerDelegate.currentConfiguration.matches
      .map((e) => e.route as GoRoute)
      .toList();

  @override
  void initState() {
    super.initState();
    cubit.loadClosures();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: NavigationHeader(routes: routes),
      content: BlocBuilder<ClosureListCubit, ClosureListState>(
        builder: (context, state) {
          switch (state) {
            case ClosureListStateInitial() || ClosureListStateLoading():
              return const Center(child: ProgressRing());
            case ClosureListStateData(:final closures):
              return DynMouseScroll(
                durationMS: 100,
                builder: (context, controller, physics) => ListView.separated(
                  controller: controller,
                  physics: physics,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  itemCount: closures.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: AddClosureCard(),
                      );
                    }
                    return ClosureCard(
                      closure: closures[index - 1],
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 6),
                ),
              );
            case ClosureListStateError():
              return const Center(child: Text('Ошибка'));
          }
        },
      ),
    );
  }
}
