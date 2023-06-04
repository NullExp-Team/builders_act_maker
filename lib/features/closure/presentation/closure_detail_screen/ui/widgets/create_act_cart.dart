import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../editor/data/document_type/document_type.dart';
import '../../cubit/closure_detail_cubit.dart';

class CreateActCart extends StatelessWidget {
  const CreateActCart({super.key});

  @override
  Widget build(BuildContext context) {
    final flyoutController = FlyoutController();

    final cubit = context.read<ClosureDetailCubit>();

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
