import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:testinaya/presentation/pages/detail_page.dart';
import 'package:testinaya/presentation/pages/home_page.dart';
part 'router.gr.dart';

@AutoRouterConfig()

/// Основной Роутер приложения
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MyHomeRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          path: '/details/:id',
          page: DetailsRoute.page,
        ),
      ];
}
