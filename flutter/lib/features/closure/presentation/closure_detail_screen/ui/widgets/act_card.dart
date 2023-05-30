import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../../models/act_data/act_data.dart';

class ActCard extends StatelessWidget {
  final ActData act;

  const ActCard({super.key, required this.act});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(act.name),
          Text(act.type.name),
          const SizedBox(height: 16),
          Row(
            children: [
              Button(
                onPressed: () {},
                child: const Row(
                  children: [
                    Icon(FluentIcons.merge_duplicate, size: 16),
                    Text('Дублировать'),
                  ],
                ),
              ),
              Button(
                onPressed: () {},
                child: const Text('Удалить'),
              ),
            ],
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var field in act.fields)
                Chip(
                  text: Text(
                    field.subText != null
                        ? '${field.subText} ${field.text}'
                        : field.text,
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}
