import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

import '../di.dart';
import 'navigation_breadcrumb.dart';
import 'package:flutter/material.dart' as m;

class NavigationHeader extends StatefulWidget {
  final List<GoRoute> routes;

  const NavigationHeader({super.key, required this.routes});

  @override
  State<NavigationHeader> createState() => _NavigationHeaderState();
}

class _NavigationHeaderState extends State<NavigationHeader> {
  @override
  Widget build(BuildContext context) {
    // TODO: Всё это кринж, переделать

    final goRouter = Di.get<GoRouter>();

    void pop(int count) {
      for (var i = 0; i < count; i++) {
        goRouter.pop();
      }
    }

    final routesLength = widget.routes.length;

    final allRoutes = widget.routes
        .map(
          (e) => e.name ?? 'Hey',
        )
        .toList();

    return PageHeader(
      title: SizedBox(
        height: 60,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: routesLength,
          itemBuilder: (context, index) => NavigationBreadcrumb(
            text: allRoutes[index],
            isCurrent: index == routesLength - 1,
            onPressed: () => pop(routesLength - 1 - index),
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
