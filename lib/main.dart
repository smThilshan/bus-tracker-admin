import 'package:bus_tracker_admin/providers/expense_provider.dart';
import 'package:bus_tracker_admin/screens/add_hire_screen.dart';
import 'package:bus_tracker_admin/screens/add_route_screen.dart';
import 'package:bus_tracker_admin/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          AddRouteScreen.routeName: (context) => const AddRouteScreen(),
          AddHireScreen.routeName: (context) => const AddHireScreen()
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
