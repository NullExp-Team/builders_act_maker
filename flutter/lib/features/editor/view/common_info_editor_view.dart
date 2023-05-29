import 'package:flutter/material.dart';

import '../../../models/field_data/field_data.dart';

// TODO думаю, надо бы это отрефакторить
class CommonInfoEditorView extends StatefulWidget {
  final List<FieldData> fieldData;
  const CommonInfoEditorView({
    super.key,
    required this.fieldData,
  });

  @override
  State<CommonInfoEditorView> createState() => _CommonInfoEditorViewState();
}

class _CommonInfoEditorViewState extends State<CommonInfoEditorView> {
  late final List<TextEditingController> controllers;

  @override
  void initState() {
    controllers = [];
    for (FieldData i in widget.fieldData) {
      controllers.add(TextEditingController(text: i.text));
      controllers.add(TextEditingController(text: i.subText));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Общая информация',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              // сохраняет всю инфу из controllers через репозиторий, в результате чего closure меняется
            },
            child: const Icon(
              Icons.check,
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => Column(
          children: [
            Text('общее поле $index'),
            TextField(
              controller: controllers[index * 2],
            ),
            TextField(
              controller: controllers[index * 2 + 1],
            ),
          ],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemCount: widget.fieldData.length,
      ),
    );
  }
}
