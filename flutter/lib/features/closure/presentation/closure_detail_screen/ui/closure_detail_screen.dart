import 'package:go_router/go_router.dart';

import '../../../../../core/di.dart';
import '../../closure_list_screen/cubit/closure_list_cubit.dart';
import 'package:fluent_ui/fluent_ui.dart';
// ignore: unused_import
import 'package:flutter/material.dart' as m;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/navigation_header.dart';
import '../cubit/closure_detail_cubit.dart';

class ClosureDetailScreen extends StatefulWidget {
  final int closureId;

  const ClosureDetailScreen({
    super.key,
    required this.closureId,
  });

  @override
  State<ClosureDetailScreen> createState() => _ClosureDetailScreenState();
}

class _ClosureDetailScreenState extends State<ClosureDetailScreen> {
  final goRouter = Di.get<GoRouter>();
  late final routes = goRouter.routerDelegate.currentConfiguration.matches
      .map((e) => e.route as GoRoute)
      .toList();

  @override
  Widget build(BuildContext context) {
    // TODO: Кринж для теста, всё сделать нормально через репозиторий
    final state =
        context.read<ClosureListCubit>().state as ClosureListLoadedState;

    final closure = state.closures.firstWhere(
      (element) => element.id == widget.closureId,
    );

    return BlocBuilder<ClosureDetailCubit, ClosureDetailState>(
      bloc: ClosureDetailCubit(ClosureDetailState.loaded(closure: closure)),
      builder: (context, state) {
        switch (state) {
          case ClosureDetailInitialState() || ClosureDetailLoadingState():
            return const Center(child: ProgressRing());
          case ClosureDetailLoadedState(:final closure):
            return ScaffoldPage(
              header: NavigationHeader(routes: routes),
              content: Column(
                children: [
                  Text(closure.name),
                  Text(closure.path),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1,
                      ),
                      itemCount: closure.acts.length,
                      itemBuilder: (context, index) {
                        final act = closure.acts[index];
                        return Card(
                          child: Column(
                            children: [
                              Text(act.name),
                              Text(act.type.name),
                              const SizedBox(height: 16),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: act.fields
                                    .map(
                                      (e) => Chip(
                                        text: Text(
                                          e.subText != null
                                              ? '${e.subText} ${e.text}'
                                              : e.text,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );

          case ClosureDetailErrorState():
            return const Center(child: Text('Ошибка'));
        }
      },
    );
  }
}
