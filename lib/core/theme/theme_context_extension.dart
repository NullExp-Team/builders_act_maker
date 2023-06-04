import 'package:fluent_ui/fluent_ui.dart';

extension ThemeContextExtension on BuildContext {
  Typography get textStyles => FluentTheme.of(this).typography;
}
