import 'package:builders_act_maker/models/data_models/act_data.dart';
import 'package:builders_act_maker/models/data_models/fields_data.dart';
import 'package:builders_act_maker/models/type_models/document_type.dart';
import 'package:flutter/material.dart';

void main() {
  final a = ActData(
    name: 'da',
    fields: [FieldsData(text: ' ', hasSpace: false, subText: null)],
    type: DocumentType('key', 1),
  );
  final b = a.toJson;
  print(a.toJson().toString());
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
