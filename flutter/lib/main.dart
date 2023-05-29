import 'package:flutter/material.dart';

import 'features/editor/view/editor_view.dart';
import 'models/act_data/act_data.dart';
import 'models/closure/closure.dart';
import 'models/document_type/document_type.dart';
import 'models/field_data/field_data.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Closure closure = Closure(
      id: 0,
      name: 'lol',
      path: 'kek',
      commonInfo: [
        FieldData(
          text: 'rar',
          hasSpace: false,
          subText: null,
        ),
        FieldData(
          text: 'tat',
          hasSpace: true,
          subText: 'hah',
        ),
      ],
      acts: [
        ActData(
          name: 'super',
          type: DocumentType.actOSR,
          fields: [
            FieldData(
              text: 'rar',
              hasSpace: false,
              subText: null,
            ),
            FieldData(
              text: 'tat',
              hasSpace: true,
              subText: 'hah',
            ),
            FieldData(
              text: 'tat',
              hasSpace: false,
              subText: 'hah',
            ),
            FieldData(
              text: 'tat',
              hasSpace: false,
              subText: 'hah',
            ),
            FieldData(
              text: 'tat',
              hasSpace: true,
              subText: 'hah',
            ),
          ],
        ),
        ActData(
          name: 'repus',
          type: DocumentType.actOSR,
          fields: [
            FieldData(
              text: 'tat',
              hasSpace: false,
              subText: null,
            ),
            FieldData(
              text: 'rar',
              hasSpace: true,
              subText: 'hah',
            ),
          ],
        ),
      ],
    );
    return MaterialApp(
      home: EditorView(
        actData: closure.acts[0],
        index: 0,
      ),
    );
  }
}
