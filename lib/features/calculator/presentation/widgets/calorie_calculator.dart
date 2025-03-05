import 'package:flutter/material.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/common/calculator_card.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/common/dropdown.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/common/tf.dart';

class CalorieCalculatorTab extends StatefulWidget {
  const CalorieCalculatorTab({super.key});

  @override
  _CalorieCalculatorTabState createState() => _CalorieCalculatorTabState();
}

class _CalorieCalculatorTabState extends State<CalorieCalculatorTab> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String selectedGender = "Male";
  String selectedActivity = "Sedentary";
  int? calorieResult;

  /// **Calorie Calculation (BMR + Activity Level)**
  void calculateCalories() {
    final double? weight = double.tryParse(weightController.text);
    final double? height = double.tryParse(heightController.text);
    final int? age = int.tryParse(ageController.text);

    if (weight == null || height == null || age == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid numbers!")),
      );
      return;
    }

    // Calculate BMR (Basal Metabolic Rate)
    double bmr;
    if (selectedGender == "Male") {
      bmr = 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      bmr = 10 * weight + 6.25 * height - 5 * age - 161;
    }

    // Activity Level Multipliers
    final Map<String, double> activityMultipliers = {
      "Sedentary": 1.2,
      "Lightly Active": 1.375,
      "Moderate": 1.55,
      "Active": 1.725,
      "Very Active": 1.9,
    };

    final double calorieNeeds = bmr * (activityMultipliers[selectedActivity] ?? 1.2);

    setState(() {
      calorieResult = calorieNeeds.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CalculatorCard(
      title: 'Calorie Calculator',
      fields: [
        CustomTextField(controller: weightController, label: 'Weight (kg)'),
        CustomTextField(controller: heightController, label: 'Height (cm)'),
        CustomTextField(controller: ageController, label: 'Age'),
        CustomDropdownField(
          label: 'Gender',
          items: const ['Male', 'Female'],
          onChanged: (value) => setState(() => selectedGender = value ?? "Male"),
        ),
        CustomDropdownField(
          label: 'Activity Level',
          items: const ['Sedentary', 'Lightly Active', 'Moderate', 'Active', 'Very Active'],
          onChanged: (value) => setState(() => selectedActivity = value ?? "Sedentary"),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: calculateCalories,
            child: const Text('Calculate', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
        if (calorieResult != null) ...[
          const SizedBox(height: 12),
          Text(
            "Estimated Calories Needed: $calorieResult kcal/day",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.redAccent),
          ),
        ],
      ],
    );
  }
}
