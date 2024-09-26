import 'package:bus_tracker_admin/screens/add_hire_screen.dart';
import 'package:bus_tracker_admin/screens/add_route_screen.dart';
import 'package:bus_tracker_admin/screens/log_income_screen.dart';
import 'package:bus_tracker_admin/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bus_tracker_admin/screens/add_expenses_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController _carouselController = CarouselController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Adding dialog box
  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildAddItemOption(Icons.route, 'Route', context),
                const SizedBox(height: 12),
                _buildAddItemOption(Icons.directions_bus, 'Hire', context),
                const SizedBox(height: 12),
                _buildAddItemOption(Icons.money_off, 'Expenses', context),
                const SizedBox(height: 12),
                _buildAddItemOption(Icons.notifications, 'Reminder', context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddItemOption(
      IconData iconData, String title, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context); // Close the dialog
        // Navigate to the respective screen based on the title
        if (title == 'Route') {
          Navigator.pushNamed(context, AddRouteScreen.routeName);
        } else if (title == 'Hire') {
          Navigator.pushNamed(context, AddHireScreen.routeName);
        } else if (title == 'Expenses') {
          Navigator.pushNamed(context, AddExpenseScreen.routeName);
        } else if (title == 'Reminder') {
          // Navigate to the reminder screen (Placeholder)
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.withOpacity(0.1),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.black87,
              size: 24.0,
            ),
            const SizedBox(width: 16.0),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddDialog(context); // Show the add dialog
        },
        backgroundColor: Colors.black87,
        foregroundColor: Colors.yellow,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Income',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_rounded),
            label: 'Expense',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Reminder',
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          // Content for Home
          // Center(child: Text("Home")),
          DashboardScreen(),
          // IncomeScreen is properly placed here
          IncomeScreen(),
          // Placeholder for ExpensesScreen
          Center(child: Text("Expenses")),
          // Placeholder for ReminderScreen
          Center(child: Text("Reminder")),
        ],
      ),
    );
  }
}
