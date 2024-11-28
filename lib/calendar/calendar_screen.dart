import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarViewScreen extends StatefulWidget {
  const CalendarViewScreen({super.key});

  @override
  CalendarViewScreenState createState() => CalendarViewScreenState();
}

class CalendarViewScreenState extends State<CalendarViewScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _events = {};

  @override
  void initState() {
    super.initState();

    // Dummy event data for the calendar
    _events = {
      DateTime.now().subtract(const Duration(days: 1)): ['Complete Assignment'],
      DateTime.now(): ['Club Meeting', 'Study for Exams'],
      DateTime.now().add(const Duration(days: 1)): ['Project Deadline'],
    };
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar View'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2020, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            eventLoader: _getEventsForDay,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            calendarStyle: const CalendarStyle(
              markerDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          _buildEventList(),
        ],
      ),
    );
  }

  // Display the events for the selected day
  Widget _buildEventList() {
    List<String> selectedDayEvents = _getEventsForDay(_selectedDay ?? DateTime.now());

    return Expanded(
      child: ListView.builder(
        itemCount: selectedDayEvents.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(selectedDayEvents[index]),
          );
        },
      ),
    );
  }
}
