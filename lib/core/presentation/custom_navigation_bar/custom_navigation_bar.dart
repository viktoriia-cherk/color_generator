import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final TabsRouter tabsRouter;

  const CustomNavigationBar({super.key, required this.tabsRouter});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // backgroundColor: AppColors.red,
      currentIndex: tabsRouter.activeIndex,
      onTap: (index) {
        tabsRouter.setActiveIndex(index);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.color_lens),
          label: 'Generator',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
      ],
    );
  }
}
