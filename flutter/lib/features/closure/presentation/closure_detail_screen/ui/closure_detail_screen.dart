import 'package:fluent_ui/fluent_ui.dart';
// ignore: unused_import
import 'package:flutter/material.dart' as m;

import '../../../../../core/widgets/navigation_header.dart';

class ClosureDetailScreen extends StatefulWidget {
  final int closureId;

  const ClosureDetailScreen({
    super.key,
    required this.closureId,
  });

  @override
  State<ClosureDetailScreen> createState() => _ClosureDetailScreenState();
}

class _ClosureDetailScreenState extends State<ClosureDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const ScaffoldPage(
      header: NavigationHeader(),
    );
  }
}
