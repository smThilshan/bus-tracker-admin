import 'package:flutter/material.dart';

class IncomeScreen extends StatefulWidget {
  static const routeName = 'income_screen';

  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  bool _isRouteSelected = true; // To toggle between Route and Hire

  // Sample data for Route Income
  final List<Map<String, String>> _routeIncome = [
    {'amount': 'Rs. 22', 'date': '2024-09-01'},
    {'amount': 'Rs. 150', 'date': '2024-09-02'},
    {'amount': 'Rs. 80', 'date': '2024-09-03'},
  ];

  // Sample data for Hire Income
  final List<Map<String, String>> _hireIncome = [
    {'amount': 'Rs. 300', 'date': '2024-09-01'},
    {'amount': 'Rs. 450', 'date': '2024-09-05'},
    {'amount': 'Rs. 220', 'date': '2024-09-10'},
  ];

  // Function to toggle between Route and Hire
  void _toggleIncomeCategory(bool isRouteSelected) {
    setState(() {
      _isRouteSelected = isRouteSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top switch buttons for Route and Hire
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _isRouteSelected ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () => _toggleIncomeCategory(true),
                    child: Text('Route'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          !_isRouteSelected ? Colors.blue : Colors.grey,
                    ),
                    onPressed: () => _toggleIncomeCategory(false),
                    child: Text('Hire'),
                  ),
                ),
              ],
            ),
          ),

          // List of income based on the selected category (Route or Hire)
          Expanded(
            child: ListView.builder(
              itemCount:
                  _isRouteSelected ? _routeIncome.length : _hireIncome.length,
              itemBuilder: (context, index) {
                final incomeData =
                    _isRouteSelected ? _routeIncome[index] : _hireIncome[index];
                return ListTile(
                  leading: Icon(Icons.attach_money, color: Colors.green),
                  title: Text(incomeData['amount']!),
                  subtitle: Text(incomeData['date']!),
                  trailing: Icon(Icons.arrow_forward_ios),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
