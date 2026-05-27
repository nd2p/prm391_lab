import 'package:flutter/material.dart';

// Exercise 4: App Structure with Scaffold, AppBar, FAB, and Theme toggle.
class AppStructureDemo extends StatelessWidget {
  const AppStructureDemo({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  final bool isDarkMode;
  final ValueChanged<bool> onToggleTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 4 - App Structure'),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Dark'),
              const SizedBox(width: 6),
              Switch.adaptive(value: isDarkMode, onChanged: onToggleTheme),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
      body: const Center(
        child: Text('This is a simple screen with theme toggle.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
