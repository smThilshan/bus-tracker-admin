import 'package:flutter/material.dart';

// Reusable CustomButton widget
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double width;
  final double height;

  // Constructor for customization
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue, // Default button color
    this.width = double.infinity, // Full-width by default
    this.height = 50.0, // Default height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color, // Button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
          ),
          padding: EdgeInsets.symmetric(
              vertical: 16.0), // Padding for comfortable tapping
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white, // Text color
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
