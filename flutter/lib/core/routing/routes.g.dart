// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $homeRoute,
      $closureListRoute,
    ];

RouteBase get $homeRoute => GoRouteData.$route(
      path: '/',
      factory: $HomeRouteExtension._fromState,
    );

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

RouteBase get $closureListRoute => GoRouteData.$route(
      path: '/closures',
      name: 'Список закрытий',
      factory: $ClosureListRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: ':closureId',
          name: 'Закрытие',
          factory: $ClosureDetailRouteExtension._fromState,
        ),
      ],
    );

extension $ClosureListRouteExtension on ClosureListRoute {
  static ClosureListRoute _fromState(GoRouterState state) =>
      const ClosureListRoute();

  String get location => GoRouteData.$location(
        '/closures',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}

extension $ClosureDetailRouteExtension on ClosureDetailRoute {
  static ClosureDetailRoute _fromState(GoRouterState state) =>
      ClosureDetailRoute(
        closureId: int.parse(state.pathParameters['closureId']!),
      );

  String get location => GoRouteData.$location(
        '/closures/${Uri.encodeComponent(closureId.toString())}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);
}
