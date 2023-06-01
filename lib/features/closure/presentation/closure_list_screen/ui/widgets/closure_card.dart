import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/theme_context_extension.dart';
import '../../../../data/closure/closure.dart';
import '../../cubit/closure_list_cubit.dart';

class ClosureCard extends StatelessWidget {
  final Closure closure;

  const ClosureCard({super.key, required this.closure});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClosureListCubit>();
    final flyoutController = FlyoutController();

    return Button(
      onPressed: () => cubit.goToClosureDetail(closure),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(FluentIcons.document_set, size: 20),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      closure.name,
                      style: context.textStyles.bodyLarge,
                    ),
                    Text(
                      closure.path,
                      style: context.textStyles.caption?.copyWith(
                        color: Colors.grey[80],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            FlyoutTarget(
              controller: flyoutController,
              child: IconButton(
                icon: const Icon(FluentIcons.delete),
                onPressed: () {
                  flyoutController.showFlyout(
                    builder: (context) {
                      return FlyoutContent(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Вы уверены, что хотите удалить это закрытие?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            Button(
                              onPressed: () {
                                cubit.deleteClosure(closure);
                                Flyout.of(context).close();
                              },
                              child: const Text('Да, удалить закрытие'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
