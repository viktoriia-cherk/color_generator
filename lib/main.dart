import 'package:flutter/material.dart';

import 'core/presentation/theme/theme.dart';
import 'features/home_page/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appThemeData,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
