import 'package:flutter/material.dart';

import 'core/presentation/theme/theme.dart';
import 'features/home_page/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: baseTheme(Brightness.light),
      darkTheme: baseTheme(Brightness.dark),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: HomePage(onToggleTheme: _toggleTheme),
    );
  }
}
