import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as m;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/di.dart';
import '../../bloc/editor_cubit.dart';

class ActName extends StatefulWidget {
  const ActName({
    super.key,
  });

  @override
  State<ActName> createState() => _ActNameState();
}

class _ActNameState extends State<ActName> {
  late final TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final goRouter = Di.get<GoRouter>();
    final cubit = Di.get<EditorCubit>();

    return BlocBuilder<EditorCubit, EditorState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is EditorStateLoaded) {
          final actData = state.act;
          controller.text = actData.name;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                state.isNameChanging
                    ? SizedBox(
                        width: 400,
                        child: TextBox(
                          controller: controller,
                          style: const TextStyle(fontSize: 32),
                        ),
                      )
                    : Text(
                        actData.name,
                        style: const TextStyle(fontSize: 32),
                      ),
                const SizedBox(width: 30),
                Button(
                  onPressed: () => cubit.onNameEdit(controller.text),
                  child: Icon(
                    state.isNameChanging ? m.Icons.save : m.Icons.edit,
                  ),
                ),
                const Spacer(),
                Button(
                  child: const Text('Сохранить изменения'),
                  onPressed: () {
                    Di.get<EditorCubit>().onSave();
                    goRouter.pop();
                  },
                ),
              ],
            ),
          );
        } else {
          return const Text('Загрузка...');
        }
      },
    );
  }
}
