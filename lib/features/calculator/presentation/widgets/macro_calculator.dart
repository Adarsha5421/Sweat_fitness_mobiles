import 'package:flutter/material.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/common/calculator_card.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/common/dropdown.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/common/tf.dart';

class MacroCalculatorTab extends StatefulWidget {
  const MacroCalculatorTab({super.key});

  @override
  _MacroCalculatorTabState createState() => _MacroCalculatorTabState();
}

class _MacroCalculatorTabState extends State<MacroCalculatorTab> {
  final TextEditingController weightController = TextEditingController();
  String selectedGoal = "Maintain";
  Map<String, double>? macroResult;

  /// **Macro Calculation based on Goal**
  void calculateMacros() {
    final double? weight = double.tryParse(weightController.text);

    if (weight == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter a valid weight!")),
      );
      return;
    }

    Map<String, double> macros;
    if (selectedGoal == "Gain Weight") {
      macros = {"Protein": weight * 2.2, "Carbs": weight * 3, "Fats": weight * 1};
    } else if (selectedGoal == "Lose Weight") {
      macros = {"Protein": weight * 2.5, "Carbs": weight * 2, "Fats": weight * 0.8};
    } else {
      macros = {"Protein": weight * 2, "Carbs": weight * 2.5, "Fats": weight * 0.9};
    }

    setState(() {
      macroResult = macros;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.brightness == Brightness.dark ? Colors.blueAccent : Colors.blue;
    final textColor = theme.brightness == Brightness.dark ? Colors.yellowAccent : Colors.yellow;
    final resultColor = theme.brightness == Brightness.dark ? Colors.redAccent : Colors.red;

    return CalculatorCard(
      title: 'Macro Calculator',
      fields: [
        CustomTextField(controller: weightController, label: 'Weight (kg)'),
        CustomDropdownField(
          label: 'Goal',
          items: const ['Maintain', 'Lose Weight', 'Gain Weight'],
          onChanged: (value) => setState(() => selectedGoal = value ?? "Maintain"),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: calculateMacros,
            child: const Text('Calculate', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
        if (macroResult != null) ...[
          const SizedBox(height: 12),
          Text(
            "Macros Breakdown:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          ),
          Text("Protein: ${macroResult!['Protein']!.toStringAsFixed(1)}g/day", style: TextStyle(color: resultColor)),
          Text("Carbs: ${macroResult!['Carbs']!.toStringAsFixed(1)}g/day", style: TextStyle(color: resultColor)),
          Text("Fats: ${macroResult!['Fats']!.toStringAsFixed(1)}g/day", style: TextStyle(color: resultColor)),
        ],
      ],
    );
  }
}
