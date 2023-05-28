import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../models/closure/closure.dart';
import '../../cubit/closure_cubit.dart';

class ClosureCard extends StatelessWidget {
  final Closure closure;

  const ClosureCard({super.key, required this.closure});

  @override
  Widget build(BuildContext context) {
    final textStyles = FluentTheme.of(context).typography;

    final cubit = context.read<ClosureCubit>();

    return Button(
      onPressed: cubit.goToClosureDetailScreen,
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
                      style: textStyles.bodyLarge,
                    ),
                    Text(
                      closure.path,
                      style: textStyles.caption?.copyWith(
                        color: Colors.grey[80],
                      ),
                    ),
                  ],
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
