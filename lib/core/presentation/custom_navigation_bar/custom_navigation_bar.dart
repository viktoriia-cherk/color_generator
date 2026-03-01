import 'package:auto_route/auto_route.dart';
import 'package:color_generator/features/color_generator_page/application/color_generator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavigationBar extends StatelessWidget {
  final TabsRouter tabsRouter;

  const CustomNavigationBar({super.key, required this.tabsRouter});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: tabsRouter.activeIndex,
      onTap: (i) {
        if (i == 1) {
          context.read<ColorGeneratorBloc>().add(
            ColorGeneratorEvent.getColorsHistory(),
          );
        }
        tabsRouter.setActiveIndex(i);
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
