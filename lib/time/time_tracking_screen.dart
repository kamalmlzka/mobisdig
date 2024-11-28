import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';  // Add this for PieChart

class TimeTrackingScreen extends StatelessWidget {
  const TimeTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Tracking & Analytics'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header for Pie Chart Section
            const Text(
              'Time Spent Today',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Pie Chart Widget
            SizedBox(
              height: 250,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.blue,
                      value: 40,
                      title: 'Study (40%)',
                      radius: 60,
                      titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    PieChartSectionData(
                      color: Colors.green,
                      value: 30,
                      title: 'Social Media (30%)',
                      radius: 60,
                      titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    PieChartSectionData(
                      color: Colors.red,
                      value: 20,
                      title: 'Other (20%)',
                      radius: 60,
                      titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    PieChartSectionData(
                      color: Colors.orange,
                      value: 10,
                      title: 'Leisure (10%)',
                      radius: 60,
                      titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Analytics Header
            const Text(
              'Daily Summary',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // List of analytics stats
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.book, color: Colors.blue),
                    title: Text('Study'),
                    trailing: Text('4 hrs'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone_android, color: Colors.green),
                    title: Text('Social Media'),
                    trailing: Text('3 hrs'),
                  ),
                  ListTile(
                    leading: Icon(Icons.other_houses, color: Colors.red),
                    title: Text('Other'),
                    trailing: Text('2 hrs'),
                  ),
                  ListTile(
                    leading: Icon(Icons.sports_esports, color: Colors.orange),
                    title: Text('Leisure'),
                    trailing: Text('1 hr'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
