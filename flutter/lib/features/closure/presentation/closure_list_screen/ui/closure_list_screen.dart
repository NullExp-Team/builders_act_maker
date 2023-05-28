import 'widgets/add_closure_card.dart';

import 'widgets/closure_card.dart';
import 'package:fluent_ui/fluent_ui.dart';

import '../../../../../models/closure/closure.dart';

// TODO: Фикс множественного rebuild

class ClosureListScreen extends StatefulWidget {
  const ClosureListScreen({super.key});

  @override
  State<ClosureListScreen> createState() => _ClosureListScreenState();
}

class _ClosureListScreenState extends State<ClosureListScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Text('Список закрытий'),
      ),
      content: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        itemCount: 5 + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: AddClosureCard(),
            );
          }
          return ClosureCard(
            closure: Closure.random(),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 5),
      ),
    );
  }
}
