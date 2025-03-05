import 'package:flutter/material.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/common/calculator_card.dart';
import 'package:gym_tracker_app/features/calculator/presentation/widgets/common/tf.dart';

class OneRepMaxCalculatorTab extends StatefulWidget {
  const OneRepMaxCalculatorTab({super.key});

  @override
  _OneRepMaxCalculatorTabState createState() => _OneRepMaxCalculatorTabState();
}

class _OneRepMaxCalculatorTabState extends State<OneRepMaxCalculatorTab> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController repsController = TextEditingController();
  double? oneRepMax;

  /// **Calculate One-Rep Max using Epley formula**
  void calculateOneRepMax() {
    final double? weight = double.tryParse(weightController.text);
    final int? reps = int.tryParse(repsController.text);

    if (weight == null || reps == null || reps < 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter valid weight and reps!")),
      );
      return;
    }

    setState(() {
      oneRepMax = weight * (1 + reps / 30);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.brightness == Brightness.dark ? Colors.blueAccent : Colors.blue;
    final textColor = theme.brightness == Brightness.dark ? Colors.yellowAccent : Colors.yellow;
    final resultColor = theme.brightness == Brightness.dark ? Colors.redAccent : Colors.red;

    return CalculatorCard(
      title: 'One-Rep Max Calculator',
      fields: [
        CustomTextField(controller: weightController, label: 'Weight Lifted (kg)'),
        CustomTextField(controller: repsController, label: 'Reps Performed'),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
            onPressed: calculateOneRepMax,
            child: const Text('Calculate', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
        ),
        if (oneRepMax != null) ...[
          const SizedBox(height: 12),
          Text(
            "Estimated 1RM:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          ),
          Text("${oneRepMax!.toStringAsFixed(1)} kg", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: resultColor)),
        ],
      ],
    );
  }
}
