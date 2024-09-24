import 'package:flutter/material.dart';

class SelectionBox extends StatefulWidget {
  @override
  _SelectionBoxState createState() => _SelectionBoxState();
}

class _SelectionBoxState extends State<SelectionBox> {
  // List of options
  final List<String> items = [
    '01',
    '02',
    '03',
    '04',
  ];

  // Selected value
  String selectedValue = '01'; // Default selected value

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
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: SelectionBox()));
