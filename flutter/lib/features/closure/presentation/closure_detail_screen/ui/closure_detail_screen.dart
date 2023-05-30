import '../../../../../core/theme/theme_context_extension.dart';
import 'widgets/act_card.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di.dart';
import 'package:fluent_ui/fluent_ui.dart';
// ignore: unused_import
import 'package:flutter/material.dart' as m;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/navigation_header.dart';
import '../cubit/closure_detail_cubit.dart';
import 'widgets/create_act_cart.dart';

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
  final scrollController = ScrollController();

  final gridKey = GlobalKey();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO: явно есть какая-то реализация получше
    final goRouter = Di.get<GoRouter>();
    final routes = goRouter.routerDelegate.currentConfiguration.matches
        .map((e) => e.route as GoRoute)
        .toList();

    final cubit = Di.get<ClosureDetailCubit>()..setClosure(widget.closureId);
    return BlocBuilder<ClosureDetailCubit, ClosureDetailState>(
      bloc: cubit,
      builder: (context, state) {
        switch (state) {
          case ClosureDetailStateInitial() || ClosureDetailStateLoading():
            return const Center(child: ProgressRing());
          case ClosureDetailStateData(:var closure):
            return ScaffoldPage(
              header: NavigationHeader(routes: routes),
              content: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      closure.name,
                      style: context.textStyles.title,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      closure.path,
                      style: context.textStyles.bodyLarge?.copyWith(
                        color: Colors.grey[80],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const InfoBar(
                      title: Text('Справка'),
                      content: Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Text(
                          'Можно менять порядок актов, зажимая и перетаскивая их.',
                        ),
                      ),
                      severity: InfoBarSeverity.info,
                      isLong: true,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ReorderableBuilder(
                        scrollController: scrollController,
                        onReorder: (orderUpdateEntities) => cubit.reorderGrid(
                          orderUpdateEntities.map(
                            (e) => (oldIndex: e.oldIndex, newIndex: e.newIndex),
                          ),
                        ),
                        builder: (children) => GridView.builder(
                          key: gridKey,
                          controller: scrollController,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 400,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 2.25,
                          ),
                          itemCount: children.length,
                          itemBuilder: (context, index) => children[index],
                        ),
                        lockedIndices: [closure.acts.length],
                        children: [
                          for (var act in closure.acts)
                            ActCard(key: ValueKey(act.hashCode), act: act),
                          const CreateActCart(
                            key: Key('create_act_cart'),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );

          case ClosureDetailStateError():
            return const Center(child: Text('Ошибка'));
        }
      },
    );
  }
}
