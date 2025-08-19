import 'package:flutter/material.dart';

class BirthdayPickerBottomSheet extends StatefulWidget {
  final DateTime initialDate;

  const BirthdayPickerBottomSheet({super.key, required this.initialDate});

  @override
  State<BirthdayPickerBottomSheet> createState() =>
      _BirthdayPickerBottomSheetState();
}

class _BirthdayPickerBottomSheetState
    extends State<BirthdayPickerBottomSheet> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  void _nextMonth() {
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month + 1,
        selectedDate.day >
            DateUtils.getDaysInMonth(
                selectedDate.year, selectedDate.month + 1)
            ? DateUtils.getDaysInMonth(
            selectedDate.year, selectedDate.month + 1)
            : selectedDate.day,
      );
    });
  }

  void _previousMonth() {
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month - 1,
        selectedDate.day >
            DateUtils.getDaysInMonth(
                selectedDate.year, selectedDate.month - 1)
            ? DateUtils.getDaysInMonth(
            selectedDate.year, selectedDate.month - 1)
            : selectedDate.day,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth =
    DateUtils.getDaysInMonth(selectedDate.year, selectedDate.month);
    final firstDayOfMonth = DateTime(selectedDate.year, selectedDate.month, 1);
    final weekdayOffset = firstDayOfMonth.weekday % 7;

    return FractionallySizedBox(
      heightFactor: 0.95, // takes 75% of screen height
      child: Container(
        color: const Color(0xFFF9F9F9), // light background color
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            const Text(
              "Birthday",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),

            // Year + Month + Navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _previousMonth,
                  icon: const Icon(Icons.arrow_left, color: Colors.black87),
                ),
                Column(
                  children: [
                    Text(
                      '${selectedDate.year}',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFB800),
                      ),
                    ),
                    Text(
                      _monthName(selectedDate.month),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFFFFB800),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: _nextMonth,
                  icon: const Icon(Icons.arrow_right, color: Colors.blue),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Day Grid with scroll
            Expanded(
              child: SingleChildScrollView(
                child: _buildDayGrid(daysInMonth, weekdayOffset),
              ),
            ),

            const SizedBox(height: 12),

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context, selectedDate),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFB800),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child:
                const Text('Save', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayGrid(int totalDays, int offset) {
    final List<Widget> dayWidgets = [];

    for (int i = 0; i < offset; i++) {
      dayWidgets.add(Container()); // spacer
    }

    for (int day = 1; day <= totalDays; day++) {
      final bool isSelected = selectedDate.day == day;

      dayWidgets.add(
        GestureDetector(
          onTap: () {
            setState(() {
              selectedDate =
                  DateTime(selectedDate.year, selectedDate.month, day);
            });
          },
          child: Container(
            margin: const EdgeInsets.all(4),
            width: 60,
            height: 60,
            alignment: Alignment.center,
            decoration: isSelected
                ? const BoxDecoration(
              color: Color(0xFFFFB800),
              shape: BoxShape.circle,
            )
                : null,
            child: Text(
              '$day',
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight:
                isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      );
    }

    return GridView.count(
      crossAxisCount: 7,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: dayWidgets,
    );
  }

  String _monthName(int month) {
    const months = [
      '',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month];
  }
}
