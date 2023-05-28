import 'package:fluent_ui/fluent_ui.dart';
// ignore: unused_import
import 'package:flutter/material.dart' as m;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/closure_cubit.dart';

class AddClosureCard extends StatelessWidget {
  const AddClosureCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = FluentTheme.of(context).typography;
    final cubit = context.read<ClosureCubit>();

    return Button(
      onPressed: null,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Создать новое закрытие',
              style: textStyles.body,
            ),
            Button(
              onPressed: cubit.goToAddClosureScreen,
              child: const Text('Добавить закрытие'),
            )
          ],
        ),
      ),
    );
  }
}
