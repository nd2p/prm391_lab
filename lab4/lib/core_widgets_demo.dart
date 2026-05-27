import 'package:flutter/material.dart';

// Exercise 1: Core Widgets (Text, Icon, Image, Card/ListTile).
class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
      color: const Color(0xFF1B1B1F),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF4F1F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F1F8),
        foregroundColor: const Color(0xFF1B1B1F),
        elevation: 0,
        title: const Text('Exercise 1 - Core Widgets'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Exercise 1 - Core Widgets', style: headerStyle),
            const SizedBox(height: 12),
            Text(
              'Welcome to Flutter UI!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1B1B1F),
              ),
            ),
            const SizedBox(height: 12),
            const Icon(Icons.movie, size: 56, color: Color(0xFF2196F3)),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/fpt.jpg',
                height: 170,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.star, color: Color(0xFF6B6B6B)),
                title: const Text('Movie Item'),
                subtitle: const Text(
                  'This is a sample ListTile inside a Card.',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
