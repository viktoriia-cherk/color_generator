import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

part 'app_routes.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      page: HomeRoute.page,
      path: AppRoutes.home,
      children: [
        AutoRoute(
          page: ColorGeneratorRoute.page,
          path: AppRoutes.colorGenerator,
          initial: true,
        ),
        AutoRoute(page: HistoryRoute.page, path: AppRoutes.history),
      ],
    ),
  ];
}
