import 'package:flutter/material.dart';

// Import all the necessary screens (pages)
import 'dashboard/dashboard_screen.dart';        // Page 1: Home/Dashboard
import 'task/task_creation_screen.dart';    // Page 2: Task Creation
import 'calendar/calendar_screen.dart';    // Page 3: Calendar View
import 'time/time_tracking_screen.dart';    // Page 4: Time Tracking
import 'notification/validation_and_feedback_screen.dart';   // Page 5: MVP Validation & Feedback

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Time Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreenWithNavBar(),
    );
  }
}

class HomeScreenWithNavBar extends StatefulWidget {
  const HomeScreenWithNavBar({super.key});

  @override
  HomeScreenWithNavBarState createState() => HomeScreenWithNavBarState();
}

class HomeScreenWithNavBarState extends State<HomeScreenWithNavBar> {
  int _selectedIndex = 0;

  // List of pages that will be navigated using the bottom navigation bar
  final List<Widget> _pages = [
    const DashboardScreen(),         // Page 1: Home/Dashboard
    const TaskCreationScreen(),       // Page 2: Task Creation
    const CalendarViewScreen(),       // Page 3: Calendar View
    const TimeTrackingScreen(),       // Page 4: Time Tracking
    const MVPValidationScreen(),      // Page 5: MVP Validation & Feedback
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],  // Show the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,  // Keeps all icons visible even on low count
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Create Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Time Tracking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: 'Feedback',
          ),
        ],
      ),
    );
  }
}
