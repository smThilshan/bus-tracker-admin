import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Reusable MyTextfieldWidget
class MyTextfieldWidget extends StatefulWidget {
  final String label;
  final TextInputType inputType;
  final void Function(String)? onChanged;

  // Constructor with optional parameters for customization
  const MyTextfieldWidget({
    Key? key,
    required this.label,
    this.inputType = TextInputType.number,
    this.onChanged,
  }) : super(key: key);

  @override
  State<MyTextfieldWidget> createState() => _MyTextfieldWidgetState();
}

class _MyTextfieldWidgetState extends State<MyTextfieldWidget> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      child: TextFormField(
        controller: textController,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(),
        ),
        inputFormatters: [
          if (widget.inputType == TextInputType.number)
            FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: widget.onChanged, // Callback for value changes
      ),
    );
  }
}
