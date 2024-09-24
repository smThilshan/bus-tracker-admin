import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Reusable DateSelectorWidget widget
class DateSelectorWidget extends StatefulWidget {
  @override
  _DateSelectorWidgetState createState() => _DateSelectorWidgetState();
}

class _DateSelectorWidgetState extends State<DateSelectorWidget> {
  final TextEditingController dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dateController,
      readOnly: true,
      decoration: const InputDecoration(
        labelText: 'Select Date',
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.calendar_today),
      ),
      onTap: () => _selectDate(context),
    );
  }
}

// Main screen using the DateSelectorWidget widget
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Using DateSelectorWidget widget
            DateSelectorWidget(),
            SizedBox(height: 20),
            // Another example component or widget
            Text('Additional content or widgets here'),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: MainScreen()));
