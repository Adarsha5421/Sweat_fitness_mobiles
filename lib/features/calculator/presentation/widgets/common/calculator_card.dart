import 'package:flutter/material.dart';

class CalculatorCard extends StatelessWidget {
  final String title;
  final List<Widget> fields;

  const CalculatorCard({super.key, required this.title, required this.fields});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.redAccent)),
              const SizedBox(height: 12),
              ...fields,
              const SizedBox(height: 12),
              // SizedBox(
              //   width: double.infinity,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              //     onPressed: () {},
              //     child: const Text('Calculate', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
