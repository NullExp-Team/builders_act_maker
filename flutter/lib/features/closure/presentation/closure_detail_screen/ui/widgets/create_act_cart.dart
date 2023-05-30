import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';

import '../../../../../../core/di.dart';
import '../../../../../editor/data/document_type/document_type.dart';
import '../../cubit/closure_detail_cubit.dart';

class CreateActCart extends StatelessWidget {
  const CreateActCart({super.key});

  @override
  Widget build(BuildContext context) {
    final flyoutController = FlyoutController();

    final cubit = Di.get<ClosureDetailCubit>();

    return FlyoutTarget(
      controller: flyoutController,
      child: Button(
        onPressed: () {
          flyoutController.showFlyout(
            builder: (context) => MenuFlyout(
              items: [
                for (var type in DocumentType.availableValues)
                  MenuFlyoutItem(
                    text: Text(type.label),
                    onPressed: () {
                      cubit.createAct(type);
                      Flyout.of(context).close();
                    },
                  ),
                if (kDebugMode)
                  MenuFlyoutItem(
                    text: const Text('Random (debug only)'),
                    onPressed: () {
                      cubit.createRandomAct();
                      Flyout.of(context).close();
                    },
                  ),
              ],
            ),
          );
        },
        child: const Center(
          child: Icon(FluentIcons.add, size: 32),
        ),
      ),
    );
  }
}
