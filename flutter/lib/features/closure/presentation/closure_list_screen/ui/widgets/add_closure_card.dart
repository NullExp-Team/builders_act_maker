import 'package:fluent_ui/fluent_ui.dart';
// ignore: unused_import
import 'package:flutter/material.dart' as m;

class AddClosureCard extends StatelessWidget {
  const AddClosureCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = FluentTheme.of(context).typography;

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
              onPressed: () {},
              child: const Text('Добавить закрытие'),
            )
          ],
        ),
      ),
    );
  }
}
