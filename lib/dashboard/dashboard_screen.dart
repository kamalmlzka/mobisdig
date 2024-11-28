import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:mobisdig/task/task_creation_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section: Date and Motivational Quote
            const Text(
              'October 8, 2024',  // You can dynamically get the date using DateTime.now() if needed
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '"Stay focused, stay productive!"',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),

            // Middle Section: Today's Tasks
            const Text(
              'Today\'s Tasks',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: const [
                  TaskCard(taskTitle: 'Complete Assignment', priority: 'High'),
                  TaskCard(taskTitle: 'Attend Club Meeting', priority: 'Medium'),
                  TaskCard(taskTitle: 'Prepare for Exams', priority: 'Low'),
                ],
              ),
            ),
            // Bottom Section: Time Tracking Pie Chart
            const Text(
              'Time Spent Today',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const PieChartWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TaskCreationScreen()),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Task Card Widget
class TaskCard extends StatelessWidget {
  final String taskTitle;
  final String priority;

  const TaskCard({super.key, required this.taskTitle, required this.priority});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(taskTitle),
        subtitle: Text('Priority: $priority'),
        trailing: const Icon(Icons.check_circle_outline),
      ),
    );
  }
}

// Pie Chart Widget for Time Tracking
class PieChartWidget extends StatelessWidget {
  const PieChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              color: Colors.blue,
              value: 40,
              title: 'Study',
              radius: 50,
              titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            PieChartSectionData(
              color: Colors.green,
              value: 30,
              title: 'Social',
              radius: 50,
              titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            PieChartSectionData(
              color: Colors.red,
              value: 30,
              title: 'Other',
              radius: 50,
              titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}