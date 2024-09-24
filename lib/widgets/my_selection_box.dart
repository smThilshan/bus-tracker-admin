import 'package:flutter/material.dart';

// Reusable MySelectionBoxWidget widget
class MySelectionBoxWidget extends StatefulWidget {
  // Constructor for passing initial selected value and list of items if needed
  final List<String> items;
  final String initialValue;

  MySelectionBoxWidget({required this.items, required this.initialValue});

  @override
  _MySelectionBoxWidgetState createState() => _MySelectionBoxWidgetState();
}

class _MySelectionBoxWidgetState extends State<MySelectionBoxWidget> {
  late String selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue =
        widget.initialValue; // Initialize with provided initial value
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButton<String>(
        value: selectedValue,
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        underline: SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

// Main screen to demonstrate the MySelectionBoxWidget usage
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen with MySelectionBoxWidget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Using the reusable MySelectionBoxWidget widget
            MySelectionBoxWidget(
              items: ['01', '02', '03', '04'], // Pass the list of items
              initialValue: '01', // Pass the initial selected value
            ),
            SizedBox(height: 20),
            Text('Additional content or widgets here'),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: MainScreen()));
