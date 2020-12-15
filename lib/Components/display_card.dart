import 'package:flutter/material.dart';
import '../constants.dart';

class ExerciseCard extends StatelessWidget {
  final String label;

  ExerciseCard(this.label);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label.toUpperCase(),
                style: TextStyle(fontSize: 25, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kTertiaryBackgroundColor),
    );
  }
}
