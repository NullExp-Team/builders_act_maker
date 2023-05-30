import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../../core/theme/theme_context_extension.dart';
import '../../../../../../models/act_data/act_data.dart';

class ActCard extends StatelessWidget {
  final ActData act;

  const ActCard({super.key, required this.act});

  @override
  Widget build(BuildContext context) {
    final controller = FlyoutController();

    // TODO: cibit from di
    const dynamic cubit = null;

//  cubit.goToActEditor(act.id);
    return Card(
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
                  act.name,
                  style: context.textStyles.subtitle,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              FlyoutTarget(
                controller: controller,
                child: IconButton(
                  icon: const Icon(FluentIcons.more),
                  onPressed: () => controller.showFlyout(
                    builder: (context) {
                      return MenuFlyout(
                        items: [
                          MenuFlyoutItem(
                            leading: const Icon(FluentIcons.edit),
                            text: const Text('Редактировать'),
                            onPressed: () {
                              cubit.editAct(act);
                              Flyout.of(context).close();
                            },
                          ),
                          MenuFlyoutItem(
                            leading: const Icon(FluentIcons.copy),
                            text: const Text('Дублировать'),
                            onPressed: () {
                              cubit.duplicateAct(act);
                              Flyout.of(context).close();
                            },
                          ),
                          MenuFlyoutItem(
                            leading: const Icon(FluentIcons.delete),
                            text: const Text('Удалить'),
                            onPressed: () {
                              controller.showFlyout(
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
                                            cubit.deleteAct(act);
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
              act.type.label,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.caption,
            ),
          ),
        ],
      ),
    );
  }
}
