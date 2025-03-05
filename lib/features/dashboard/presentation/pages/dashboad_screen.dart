import 'package:flutter/material.dart';
import 'package:gym_tracker_app/features/calculator/presentation/pages/calculator_screen.dart';
import 'package:gym_tracker_app/features/home/presentation/pages/home_screen.dart';
import 'package:gym_tracker_app/features/profile/presentation/pages/profile_screen.dart';
import 'package:gym_tracker_app/features/workout/presentation/pages/work_out_screen.dart';

class MyDashboardScreen extends StatefulWidget {
  final int initialIndex; // Add this
  const MyDashboardScreen({super.key, this.initialIndex = 0}); // Default is HomeScreen

  @override
  State<MyDashboardScreen> createState() => _MyDashboardScreenState();
}

class _MyDashboardScreenState extends State<MyDashboardScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex; // Set the index from constructor
  }

  List<Widget> lstBOttomScreen = [
    const HomeScreen(),
    const WorkOutScreen(),
    const CalculatorScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Dashboard'),
        //   backgroundColor: const Color.fromARGB(255, 255, 55, 0),
        //   centerTitle: true,
        // ),
        body: lstBOttomScreen[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 255, 55, 0),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.run_circle_sharp), label: 'Workout'),
            BottomNavigationBarItem(icon: Icon(Icons.calculate_sharp), label: 'Calculator'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
