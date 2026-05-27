import 'package:flutter/material.dart';

// Exercise 2: Input Widgets (Slider, Switch, RadioListTile, DatePicker).
class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double _rating = 50;
  bool _isActive = false;
  String? _genre;
  DateTime? _selectedDate;

  Future<void> _openDatePicker() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 5),
    );

    if (picked == null) {
      return;
    }

    setState(() {
      _selectedDate = picked;
    });
  }

  String _formatDate(DateTime date) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  @override
  Widget build(BuildContext context) {
    final headerStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
      color: const Color(0xFF1B1B1F),
    );
    final labelStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.w600,
      color: const Color(0xFF3A3A3F),
    );
    final valueStyle = Theme.of(
      context,
    ).textTheme.bodySmall?.copyWith(color: const Color(0xFF6B6B6B));

    return Scaffold(
      backgroundColor: const Color(0xFFF4F1F8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F1F8),
        foregroundColor: const Color(0xFF1B1B1F),
        elevation: 0,
        title: const Text('Exercise 2 - Input Controls'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Exercise 2 - Input Controls', style: headerStyle),
            const SizedBox(height: 12),
            Text('Rating (Slider)', style: labelStyle),
            Slider(
              value: _rating,
              min: 0,
              max: 100,
              divisions: 100,
              label: _rating.round().toString(),
              onChanged: (value) {
                setState(() {
                  _rating = value;
                });
              },
            ),
            Text(
              'Current value: ${_rating.toStringAsFixed(0)}',
              style: valueStyle,
            ),
            const SizedBox(height: 16),
            Text('Active (Switch)', style: labelStyle),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              title: const Text('Is movie active?'),
              value: _isActive,
              onChanged: (value) {
                setState(() {
                  _isActive = value;
                });
              },
            ),
            const SizedBox(height: 8),
            Text('Genre (RadioListTile)', style: labelStyle),
            RadioGroup<String>(
              groupValue: _genre,
              onChanged: (value) {
                setState(() {
                  _genre = value;
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text('Action'),
                    value: 'Action',
                  ),
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text('Comedy'),
                    value: 'Comedy',
                  ),
                ],
              ),
            ),
            Text('Selected genre: ${_genre ?? 'None'}', style: valueStyle),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _openDatePicker,
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFE7E2F3),
                foregroundColor: const Color(0xFF3A3A3F),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Open Date Picker'),
            ),
            const SizedBox(height: 8),
            Text(
              'Selected date: ${_selectedDate == null ? 'None' : _formatDate(_selectedDate!)}',
              style: valueStyle,
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
