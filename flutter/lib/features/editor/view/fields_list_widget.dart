import 'package:flutter/material.dart';

import '../../../models/act_data/act_data.dart';
import '../../../models/field_types/field_types.dart';

class FieldsList extends StatelessWidget {
  const FieldsList({
    super.key,
    required this.fieldsTypes,
    required this.actData,
  });

  final List<FieldType> fieldsTypes;
  final ActData actData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Column(
        children: [
          Text('поле $index'),
          switch (fieldsTypes[index]) {
            TextFieldType(nextTextMapped: var nextTextMapped) => TextField(
                controller: TextEditingController(
                  text: actData.fields[index].text,
                ),
                onSubmitted: (text) {
                  // вызов блока от text, index и nextTextMapped, чтобы поменять в ActData это поле и все зависимые
                },
              ),
            DropDownFieldType(name: var name) => DropdownButton(
                items: const [],
                onChanged: (chosen) {
                  // по name получаем из общего блока все варианты
                },
              ),
            DuplicateFieldType() => const SizedBox(),
          }
        ],
      ),
      separatorBuilder: (context, index) =>
          fieldsTypes[index] is DuplicateFieldType
              ? const SizedBox()
              : const SizedBox(
                  height: 15,
                ),
      itemCount: fieldsTypes.length,
    );
  }
}
