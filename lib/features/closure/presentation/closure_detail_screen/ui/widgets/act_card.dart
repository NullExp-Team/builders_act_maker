import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/theme_context_extension.dart';
import '../../../../../editor/data/act_data/act_data.dart';
import '../../cubit/closure_detail_cubit.dart';

class ActCard extends StatefulWidget {
  final ActData act;

  const ActCard({super.key, required this.act});

  @override
  State<ActCard> createState() => _ActCardState();
}

class _ActCardState extends State<ActCard> {
  // Инициализируем кубит тут, т.к. виджет может выходить за пределы BlocProvider и виджет не найдет кубит
  late final cubit = context.read<ClosureDetailCubit>();

  @override
  Widget build(BuildContext context) {
    final flyoutController = FlyoutController();

    return Button(
      onPressed: () => cubit.goToActEditor(widget.act.id),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  widget.act.name,
                  style: context.textStyles.subtitle,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              FlyoutTarget(
                controller: flyoutController,
                child: IconButton(
                  icon: const Icon(FluentIcons.more),
                  onPressed: () => flyoutController.showFlyout(
                    builder: (context) {
                      return MenuFlyout(
                        items: [
                          MenuFlyoutItem(
                            leading: const Icon(FluentIcons.edit),
                            text: const Text('Редактировать'),
                            onPressed: () {
                              cubit.goToActEditor(widget.act.id);
                              Flyout.of(context).close();
                            },
                          ),
                          MenuFlyoutItem(
                            leading: const Icon(FluentIcons.copy),
                            text: const Text('Дублировать'),
                            onPressed: () {
                              cubit.duplicateAct(widget.act);
                              Flyout.of(context).close();
                            },
                          ),
                          MenuFlyoutItem(
                            leading: const Icon(FluentIcons.delete),
                            text: const Text('Удалить'),
                            onPressed: () {
                              flyoutController.showFlyout(
                                builder: (context) {
                                  return FlyoutContent(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Вы уверены, что хотите удалить этот акт?',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 12.0),
                                        Button(
                                          onPressed: () {
                                            cubit.deleteAct(widget.act);
                                            Flyout.of(context)
                                              ..close()
                                              ..close();
                                          },
                                          child: const Text('Да, удалить акт'),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Chip(
            text: Text(
              widget.act.type.label,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.caption,
            ),
          ),
        ],
      ),
    );
  }
}
