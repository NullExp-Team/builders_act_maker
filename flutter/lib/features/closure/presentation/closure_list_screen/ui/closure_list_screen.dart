import 'widgets/add_closure_card.dart';
import 'package:fluent_ui/fluent_ui.dart';

import 'widgets/closure_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/closure_cubit.dart';

// TODO: Фикс множественного rebuild

class ClosureListScreen extends StatefulWidget {
  const ClosureListScreen({super.key});

  @override
  State<ClosureListScreen> createState() => _ClosureListScreenState();
}

class _ClosureListScreenState extends State<ClosureListScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClosureCubit>();
    cubit.loadClosures();

    return ScaffoldPage(
      header: const PageHeader(
        title: Text('Список закрытий'),
      ),
      content: BlocBuilder<ClosureCubit, ClosureState>(
        builder: (context, state) => switch (state) {
          ClosureInitialState() ||
          ClosureLoadingState() =>
            const Center(child: CircularProgressIndicator()),
          ClosureLoadedState() => ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              itemCount: state.closures.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: AddClosureCard(),
                  );
                }
                return ClosureCard(
                  closure: state.closures[index - 1],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 5),
            ),
          ClosureErrorState() => const Center(child: Text('Ошибка')),
        },
      ),
    );
  }
}
