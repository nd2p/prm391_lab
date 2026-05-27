import 'package:flutter/material.dart';

// Exercise 3: Layout Basics (Column, Row, Padding, ListView.builder).
class LayoutBasicsDemo extends StatelessWidget {
  const LayoutBasicsDemo({super.key});

  static const _items = [
    'Avatar',
    'Inception',
    'Interstellar',
    'Joker',
    'Arrival',
  ];

  @override
  Widget build(BuildContext context) {
    final sectionTitle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
      color: const Color(0xFF1B1B1F),
    );
    final itemTitle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w600,
      color: const Color(0xFF2C2C30),
    );
    final subtle = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(color: const Color(0xFF6B6B6B));

    return Scaffold(
      backgroundColor: const Color(0xFFF4F1F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F1F8),
        foregroundColor: const Color(0xFF1B1B1F),
        elevation: 0,
        title: const Text('Exercise 3 - Layout Basics'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Now Playing',
              style: sectionTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final title = _items[index];
                final initial = title.isNotEmpty ? title[0] : '?';
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: index == _items.length - 1 ? 0 : 8,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDE7F3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: const Color(0xFFD8D3EE),
                          foregroundColor: const Color(0xFF3A3A3F),
                          child: Text(initial),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title, style: itemTitle),
                              const SizedBox(height: 2),
                              Text('Sample description', style: subtle),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
