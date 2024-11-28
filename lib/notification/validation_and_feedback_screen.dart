import 'package:flutter/material.dart';

class MVPValidationScreen extends StatefulWidget {
  const MVPValidationScreen({super.key});

  @override
  MVPValidationScreenState createState() => MVPValidationScreenState();
}

class MVPValidationScreenState extends State<MVPValidationScreen> {
  final List<Map<String, String>> feedbackList = [
    {'name': 'John Doe', 'feedback': 'The app is really helpful!', 'rating': '5'},
    {'name': 'Jane Smith', 'feedback': 'I love the task scheduling feature.', 'rating': '4'},
    {'name': 'Sam Wilson', 'feedback': 'UI is clean, but needs more customization.', 'rating': '3'},
  ];

  final _feedbackController = TextEditingController();
  final _nameController = TextEditingController();
  String _selectedRating = '5';

  // Function to add feedback
  void _addFeedback() {
    setState(() {
      feedbackList.add({
        'name': _nameController.text,
        'feedback': _feedbackController.text,
        'rating': _selectedRating,
      });
      _nameController.clear();
      _feedbackController.clear();
    });
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MVP Validation & Feedback'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Feedback List
            Expanded(
              child: ListView.builder(
                itemCount: feedbackList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        child: Text(feedbackList[index]['rating']!),
                      ),
                      title: Text(feedbackList[index]['name']!),
                      subtitle: Text(feedbackList[index]['feedback']!),
                    ),
                  );
                },
              ),
            ),

            // Add Feedback Form
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Add Feedback',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  
                  // Name Input
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Your Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Feedback Input
                  TextField(
                    controller: _feedbackController,
                    decoration: const InputDecoration(
                      labelText: 'Your Feedback',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Rating Dropdown
                  DropdownButtonFormField<String>(
                    value: _selectedRating,
                    decoration: const InputDecoration(
                      labelText: 'Rating',
                      border: OutlineInputBorder(),
                    ),
                    items: ['5', '4', '3', '2', '1'].map((String rating) {
                      return DropdownMenuItem<String>(
                        value: rating,
                        child: Text(rating),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedRating = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 16),

                  // Submit Button
                  ElevatedButton(
                    onPressed: _addFeedback,
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                    child: const Text('Submit Feedback'),
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
