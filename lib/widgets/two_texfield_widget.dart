import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Reusable TwoTextfieldWidget
class TwoTextfieldWidget extends StatefulWidget {
  final String firstLabel;
  final String secondLabel;

  // Optional callbacks for when values change
  final void Function(String)? onFirstChanged;
  final void Function(String)? onSecondChanged;

  // Constructor with optional initial values and callbacks
  TwoTextfieldWidget({
    required this.firstLabel,
    required this.secondLabel,
    this.onFirstChanged,
    this.onSecondChanged,
  });

  @override
  _TwoTextfieldWidgetState createState() => _TwoTextfieldWidgetState();
}

class _TwoTextfieldWidgetState extends State<TwoTextfieldWidget> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // First number input box
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 8.0),
            child: TextFormField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: widget.firstLabel, // Use the provided label
                border: OutlineInputBorder(),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged:
                  widget.onFirstChanged, // Trigger callback when value changes
            ),
          ),
        ),
        // Second number input box
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 8.0),
            child: TextFormField(
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: widget.secondLabel, // Use the provided label
                border: OutlineInputBorder(),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged:
                  widget.onSecondChanged, // Trigger callback when value changes
            ),
          ),
        ),
      ],
    );
  }
}

// Main screen to demonstrate using the TwoTextfieldWidget
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen with TwoTextfieldWidget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Using the reusable TwoTextfieldWidget
            TwoTextfieldWidget(
              firstLabel: 'K - P',
              secondLabel: 'P - K',
              onFirstChanged: (value) {
                print('First box changed: $value');
              },
              onSecondChanged: (value) {
                print('Second box changed: $value');
              },
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
