import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';

import '../../../../../core/theme/theme_context_extension.dart';
import '../../../../../core/widgets/editable_value_widget.dart';
import '../file_ffi_manager/file_ffi_manager_cubit.dart';
import 'widgets/act_card.dart';
import 'package:flutter_reorderable_grid_view/widgets/reorderable_builder.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/navigation_header.dart';
import '../cubit/closure_detail_cubit.dart';
import 'widgets/create_act_cart.dart';
import '../../../../../core/widgets/message_box_button.dart';

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
  final gridKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //TODO: явно есть какая-то реализация получше
    final goRouter = Di.get<GoRouter>();
    final routes = goRouter.routerDelegate.currentConfiguration.matches
        .map((e) => e.route as GoRoute)
        .toList();
    final fileCubit = FileFfiManagerCubit();

    return BlocProvider(
      create: (context) =>
          ClosureDetailCubit(goRouter: Di.get(), repository: Di.get())
            ..setClosure(widget.closureId),
      child: BlocBuilder<ClosureDetailCubit, ClosureDetailState>(
        builder: (context, state) {
          final cubit = context.read<ClosureDetailCubit>();
          switch (state) {
            case ClosureDetailStateInitial() || ClosureDetailStateLoading():
              return const Center(child: ProgressRing());
            case ClosureDetailStateData(:var closure):
              return ScaffoldPage(
                header: NavigationHeader(
                  routes: routes,
                  isDataHasChanges: () =>
                      cubit.isClosureHasChanges(widget.closureId),
                ),
                content: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            EditableValueWidget(
                              value: closure.name,
                              onEditButtonPress: cubit.onNameEdit,
                              isEditing: state.isNameEditing,
                              textSize:
                                  context.textStyles.titleLarge?.fontSize ?? 32,
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Button(
                                  child: const Text('Общая инфрмация'),
                                  onPressed: () => cubit.goToActEditor(-1),
                                ),
                                const SizedBox(width: 10),
                                MessageBoxButton(
                                  succsessMessage: 'Файл создан!',
                                  failureMessage: 'Ошибка создания файла',
                                  child: const Text('Изменить путь'),
                                  callBack: () async => cubit.changePath(
                                    await fileCubit.choosePath(),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                MessageBoxButton(
                                  succsessMessage: 'Файл создан!',
                                  failureMessage: 'Ошибка создания файла',
                                  child: const Text('Сформировать файл'),
                                  callBack: () => fileCubit
                                      .makeFile(cubit.loadedState.closure),
                                ),
                                const SizedBox(width: 10),
                                MessageBoxButton(
                                  succsessMessage: 'Открывается файл...',
                                  failureMessage: 'Файл не найден!',
                                  child: const Text('Открыть файл'),
                                  callBack: () => fileCubit
                                      .openFile(cubit.loadedState.closure),
                                ),
                                const SizedBox(width: 10),
                                MessageBoxButton(
                                  succsessMessage:
                                      'Можно менять порядок элементов, зажимая и перетаскивая их.',
                                  child: const Icon(
                                    FluentIcons.info,
                                    size: 18,
                                  ),
                                  callBack: () => true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: DynMouseScroll(
                          builder: (context, controller, physics) =>
                              ReorderableBuilder(
                            scrollController: controller,
                            onReorder: (orderUpdateEntities) =>
                                cubit.reorderGrid(
                              orderUpdateEntities.map(
                                (e) => (
                                  oldIndex: e.oldIndex,
                                  newIndex: e.newIndex
                                ),
                              ),
                            ),
                            builder: (children) => GridView.builder(
                              key: gridKey,
                              physics: physics,
                              controller: controller,
                              padding: const EdgeInsets.symmetric(
                                vertical: 16,
                                horizontal: 32,
                              ),
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
      ),
    );
  }
}
