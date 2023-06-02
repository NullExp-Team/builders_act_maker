import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

import '../di.dart';
import 'navigation_breadcrumb.dart';
import 'package:flutter/material.dart' as m;

class NavigationHeader extends StatefulWidget {
  final List<GoRoute> routes;
  final Function? isDataHasChanges;

  const NavigationHeader(
      {super.key, required this.routes, this.isDataHasChanges});

  @override
  State<NavigationHeader> createState() => _NavigationHeaderState();
}

class _NavigationHeaderState extends State<NavigationHeader> {
  late final FlyoutController flyoutController;

  @override
  void initState() {
    flyoutController = FlyoutController();
    super.initState();
  }

  @override
  void dispose() {
    flyoutController.dispose();
    super.dispose();
  }

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
        child: FlyoutTarget(
          controller: flyoutController,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: routesLength,
            itemBuilder: (context, index) => NavigationBreadcrumb(
              text: allRoutes[index],
              isCurrent: index == routesLength - 1,
              onPressed: () async {
                if (widget.isDataHasChanges != null &&
                    widget.isDataHasChanges!()) {
                  flyoutController.showFlyout(
                    builder: (context) {
                      return FlyoutContent(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'Вы уверены, что хотите выйти без сохранения?',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Button(
                                  onPressed: () {
                                    Flyout.of(context).close();
                                    pop(routesLength - 1 - index);
                                  },
                                  child: const Text('Да'),
                                ),
                                const SizedBox(width: 15),
                                Button(
                                  onPressed: () {
                                    Flyout.of(context).close();
                                  },
                                  child: const Text('Нет'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  pop(routesLength - 1 - index);
                }
              },
            ),
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(left: 12, right: 12),
              child: Icon(m.Icons.arrow_forward_ios_sharp, size: 14),
            ),
          ),
        ),
      ),
    );
  }
}
