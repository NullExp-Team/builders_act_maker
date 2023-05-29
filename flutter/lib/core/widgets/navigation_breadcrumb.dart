import 'package:fluent_ui/fluent_ui.dart';

import '../theme/theme_context_extension.dart';

class NavigationBreadcrumb extends StatelessWidget {
  final String text;
  final bool isCurrent;
  final VoidCallback onPressed;

  const NavigationBreadcrumb({
    super.key,
    required this.text,
    required this.isCurrent,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: ButtonState.all(Colors.transparent),
        textStyle: ButtonState.all(context.textStyles.title),
        foregroundColor: ButtonState.resolveWith((states) {
          if (states.isHovering || isCurrent) return Colors.grey[20];
          return Colors.grey[80];
        }),
      ),
      icon: Text(text),
    );
  }
}
