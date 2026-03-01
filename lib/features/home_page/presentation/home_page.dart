import 'package:auto_route/auto_route.dart';
import 'package:color_generator/core/presentation/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import '../../../core/presentation/custom_navigation_bar/custom_navigation_bar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      routes: const [ColorGeneratorRoute(), HistoryRoute()],
      bottomNavigationBuilder: (context, tabsRouter) =>
          CustomNavigationBar(tabsRouter: tabsRouter),
    );
  }
}
