import 'package:bus_tracker_admin/widgets/custom_btn.dart';
import 'package:flutter/material.dart';

class AddExpenseScreen extends StatefulWidget {
  static const routeName = 'add_expense_screen';

  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;
  String? _expenseAmount;
  DateTime _selectedDate = DateTime.now();
  String? _notes;

  // Expense categories
  final List<String> _categories = ['Fuel', 'Maintenance', 'Salary', 'Other'];

  // Method to pick a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Dropdown for selecting category
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Expense Category',
                  border: OutlineInputBorder(),
                ),
                value: _selectedCategory,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                items: _categories
                    .map((category) => DropdownMenuItem(
                        value: category, child: Text(category)))
                    .toList(),
                validator: (value) =>
                    value == null ? 'Please select a category' : null,
              ),
              const SizedBox(height: 16.0),

              // Text field for entering amount
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Amount (Rs.)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an amount';
                  }
                  return null;
                },
                onSaved: (value) {
                  _expenseAmount = value;
                },
              ),
              const SizedBox(height: 16.0),

              // Date picker
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Expense Date',
                      border: OutlineInputBorder(),
                    ),
                    controller: TextEditingController(
                      text:
                          "${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}",
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Notes field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description/Notes',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onSaved: (value) {
                  _notes = value;
                },
              ),
              const SizedBox(height: 20.0),

              // Submit button
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Handle submission here, e.g., saving to database or Firebase
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Expense Added'),
                      ));
                    }
                  },
                  child: CustomButton(
                    onPressed: () {},
                    text: 'Done',
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
