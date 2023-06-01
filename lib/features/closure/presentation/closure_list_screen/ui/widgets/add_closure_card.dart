import 'package:fluent_ui/fluent_ui.dart';
// ignore: unused_import
import 'package:flutter/material.dart' as m;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/theme_context_extension.dart';
import '../../cubit/closure_list_cubit.dart';

class AddClosureCard extends StatelessWidget {
  const AddClosureCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ClosureListCubit>();

    return Button(
      onPressed: null,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Создать новое закрытие',
              style: context.textStyles.body,
            ),
            Button(
              onPressed: cubit.addNewClosure,
              child: const Text('Добавить закрытие'),
            )
          ],
        ),
      ),
    );
  }
}