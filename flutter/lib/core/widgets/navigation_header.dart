import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

import '../di.dart';
import 'navigation_breadcrumb.dart';
import 'package:flutter/material.dart' as m;

class NavigationHeader extends StatefulWidget {
  const NavigationHeader({super.key});

  @override
  State<NavigationHeader> createState() => _NavigationHeaderState();
}

class _NavigationHeaderState extends State<NavigationHeader> {
  final goRouter = Di.get<GoRouter>();

  void pop(int count) {
    for (var i = 0; i < count; i++) {
      goRouter.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentRoutes = goRouter.location.substring(1).split('/');

    final allRoutes = goRouter.routerDelegate.currentConfiguration.matches
        .map(
          (e) => (e.route as GoRoute).name ?? 'Hey',
        )
        .toList();

    return PageHeader(
      title: SizedBox(
        height: 60,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: currentRoutes.length,
          itemBuilder: (context, index) => NavigationBreadcrumb(
            text: allRoutes[index],
            isCurrent: index == currentRoutes.length - 1,
            onPressed: () => pop(currentRoutes.length - 1 - index),
          ),
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Icon(m.Icons.arrow_forward_ios_sharp, size: 14),
          ),
        ),
      ),
    );
  }
}
