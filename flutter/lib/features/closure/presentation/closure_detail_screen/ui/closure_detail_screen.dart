import 'package:go_router/go_router.dart';

import '../../../../../core/di.dart';
import 'package:fluent_ui/fluent_ui.dart';
// ignore: unused_import
import 'package:flutter/material.dart' as m;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/navigation_header.dart';
import '../cubit/closure_detail_cubit.dart';

class ClosureDetailScreen extends StatelessWidget {
  final int closureId;

  const ClosureDetailScreen({
    super.key,
    required this.closureId,
  });

  @override
  Widget build(BuildContext context) {
    //TODO: явно есть какая-то реализация получше
    final goRouter = Di.get<GoRouter>();
    final routes = goRouter.routerDelegate.currentConfiguration.matches
        .map((e) => e.route as GoRoute)
        .toList();

    final cubit = Di.get<ClosureDetailCubit>()..setClosure(closureId);
    return BlocBuilder<ClosureDetailCubit, ClosureDetailState>(
      bloc: cubit,
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
                        return Button(
                          onPressed: () => cubit.goToActEditor(act.id),
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
