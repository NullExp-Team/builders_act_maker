import 'widgets/add_closure_card.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'widgets/closure_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dyn_mouse_scroll/dyn_mouse_scroll.dart';
import '../cubit/closure_cubit.dart';

// TODO: Фикс множественного rebuild

class ClosureListScreen extends StatefulWidget {
  const ClosureListScreen({super.key});

  @override
  State<ClosureListScreen> createState() => _ClosureListScreenState();
}

class _ClosureListScreenState extends State<ClosureListScreen> {
  late final cubit = context.read<ClosureCubit>();

  @override
  void initState() {
    super.initState();
    cubit.loadClosures();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Text('Список закрытий'),
      ),
      content: BlocBuilder<ClosureCubit, ClosureState>(
        builder: (context, state) {
          switch (state) {
            case ClosureInitialState() || ClosureLoadingState():
              return const Center(child: ProgressRing());
            case ClosureLoadedState(:final closures):
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
            case ClosureErrorState():
              return const Center(child: Text('Ошибка'));
          }
        },
      ),
    );
  }
}
