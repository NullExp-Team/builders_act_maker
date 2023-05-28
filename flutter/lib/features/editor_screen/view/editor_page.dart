import 'package:flutter/material.dart';

import '../../../models/closure/closure.dart';
import '../../../models/document_type/document_type.dart';
import 'act_osr_editor.dart';
import 'clouse_act_editor.dart';
import 'common_info_editor.dart';

class EditorPage extends StatelessWidget {
  final Closure closure;
  final int? actIndex;
  const EditorPage({
    super.key,
    required this.closure,
    this.actIndex,
  });

  @override
  Widget build(BuildContext context) {
    final isAct = actIndex != null;

    final typedBody = isAct
        ? switch (closure.acts[actIndex!].type) {
            DocumentType.actOSR => ActOSREditor(
                actIndex: actIndex!,
              ),
            DocumentType.clouseAct => ClouseActEditor(
                actIndex: actIndex!,
              ),
          }
        : const CommonInfoEditor();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isAct ? closure.acts[actIndex!].name : 'Общая информация',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
        ],
      ),
      body: typedBody,
    );
  }
}
