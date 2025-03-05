import 'package:flutter/material.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/calorie_calculator.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/macro_calculator.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/one_rep_max_calculator.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const FitnessCalculatorScreen();
  }
}

class FitnessCalculatorScreen extends StatelessWidget {
  const FitnessCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fitness Calculator',
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(290, 253, 58, 58),
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: Color.fromARGB(255, 251, 81, 81),
            tabs: [
              Tab(text: 'Calories'),
              Tab(text: 'Macros'),
              Tab(text: 'One-Rep Max'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CalorieCalculatorTab(),
            MacroCalculatorTab(),
            OneRepMaxCalculatorTab(),
          ],
        ),
      ),
    );
  }
}

// Calorie Calculator UI


// Macro Calculator UI


// One-Rep Max Calculator UI


// Reusable Calculator Card


// Reusable Custom TextField


// Reusable Dropdown Field

