import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;

import '../../../../../../models/closure/closure.dart';

class ClosureCard extends StatelessWidget {
  final Closure closure;

  const ClosureCard({super.key, required this.closure});

  @override
  Widget build(BuildContext context) {
    final textStyles = FluentTheme.of(context).typography;

    return Button(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  closure.name,
                  style: textStyles.bodyLarge,
                ),
              ],
            ),
            const Icon(m.Icons.arrow_forward_ios_outlined),
          ],
        ),
      ),
    );
  }
}
