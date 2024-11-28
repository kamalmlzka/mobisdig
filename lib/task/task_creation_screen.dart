import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

class TaskCreationScreen extends StatefulWidget {
  const TaskCreationScreen({super.key});

  @override
  TaskCreationScreenState createState() => TaskCreationScreenState();
}

class TaskCreationScreenState extends State<TaskCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _taskTitle = '';
  String _priority = 'Medium';
  DateTime _dueDate = DateTime.now();
  bool _reminder = false;

  // Function to display the date picker
  Future<void> _selectDueDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _dueDate) {
      setState(() {
        _dueDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Task'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Task Title Input
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Task Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a task title';
                  }
                  return null;
                },
                onSaved: (value) {
                  _taskTitle = value!;
                },
              ),
              const SizedBox(height: 20),

              // Priority Dropdown
              DropdownButtonFormField<String>(
                value: _priority,
                decoration: const InputDecoration(
                  labelText: 'Priority',
                  border: OutlineInputBorder(),
                ),
                items: ['High', 'Medium', 'Low'].map((String priority) {
                  return DropdownMenuItem<String>(
                    value: priority,
                    child: Text(priority),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _priority = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Due Date Picker
              ListTile(
                title: Text("Due Date: ${DateFormat('dd/MM/yyyy').format(_dueDate)}"),
                trailing: const Icon(Icons.calendar_today),
                onTap: () => _selectDueDate(context),
              ),
              const SizedBox(height: 20),

              // Reminder Toggle Switch
              SwitchListTile(
                title: const Text('Set Reminder'),
                value: _reminder,
                onChanged: (bool value) {
                  setState(() {
                    _reminder = value;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // You can handle the saved data here, for example, send it to a backend or local storage
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Task Created: $_taskTitle')),
                    );
                  }
                },
                child: const Text('Create Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
