import 'package:builders_act_maker/models/document_type/document_type.dart';
import 'package:flutter/material.dart';

import 'models/act_data/act_data.dart';
import 'models/field_data/field_data.dart';

void main() {
  final a = ActData(
    name: 'da',
    fields: [FieldData(text: ' ', hasSpace: false, subText: null)],
    type: DocumentType.actOSR,
  );
  final b = a.toJson;
  print(a.toJson().toString());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
