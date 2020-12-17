import 'package:flutter/material.dart';
import 'package:get_ripped/Components/drop_down_unit_selector.dart';
import 'package:get_ripped/Components/volume_input_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

class ExerciseCard extends StatelessWidget {
  final String name;
  final int sets;
  final int reps;
  final int weight;
  final bool isMetric;
  ExerciseCard(this.name, this.sets, this.reps, this.weight, this.isMetric);

  @override
  Widget build(BuildContext context) {
    int currentSets = sets;
    int currentReps = reps;
    int currentWeight = weight;
    bool currentIsMetric = isMetric;
    return Container(
      child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name.toUpperCase(),
                style: TextStyle(fontSize: 25, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                VolumeInputField(
                    hintText: 'Sets',
                    currentValue: sets,
                    onChangedCallback: (value) {
                      currentSets = int.parse(value);
                    },
                    onEditingCompleteCallback: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setInt('$name sets', currentSets);
                    }),
                Icon(Icons.close, color: kPrimaryColor),
                VolumeInputField(
                    hintText: 'Reps',
                    currentValue: reps,
                    onChangedCallback: (value) {
                      currentReps = int.parse(value);
                    },
                    onEditingCompleteCallback: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setInt('$name reps', currentReps);
                    }),
                Icon(Icons.close, color: kPrimaryColor),
                VolumeInputField(
                    hintText: 'Weight',
                    currentValue: weight,
                    onChangedCallback: (value) {
                      currentWeight = int.parse(value);
                    },
                    onEditingCompleteCallback: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setInt('$name weight', currentWeight);
                    }),
                DropDownUnitSelector(currentIsMetric, name),
                //ToDo: (Optional) Add a way for checking the exercise as 'done' (use a check icon or change card color).
              ],
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kTertiaryBackgroundColor),
    );
  }
}
