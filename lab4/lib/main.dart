import 'package:flutter/material.dart';

import 'core_widgets_demo.dart';
import 'input_controls_demo.dart';
import 'layout_basics_demo.dart';
import 'app_structure_demo.dart';

void main() {
  runApp(const ExercisesApp());
}

class ExercisesApp extends StatefulWidget {
  const ExercisesApp({super.key});

  @override
  State<ExercisesApp> createState() => _ExercisesAppState();
}

class _ExercisesAppState extends State<ExercisesApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercises',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: _themeMode,
      // Exercise 1:
      // home: const CoreWidgetsDemo(),
      // Exercise 2:
      // home: const InputControlsDemo(),
      // Exercise 3:
      // home: const LayoutBasicsDemo(),
      // Exercise 4:
      home: AppStructureDemo(
        isDarkMode: _themeMode == ThemeMode.dark,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}
