import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_ripped/Components/volume_input_field.dart';
import 'package:get_ripped/constants.dart';
import 'package:get_ripped/exercise.dart';
import 'package:get_ripped/routine_list.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List<Exercise> exercises = [
    //   Exercise('dumbbell bench press', 4, 12, 10, true),
    //   Exercise('barbell bench press', 4, 12, 10, true),
    // ];

    dynamic source =
        Provider.of<RoutineList>(context).routines[0].days[0].exercises;

    List<String> dummy = ['a', 'b'];
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [kPrimaryBackgroundColor, kSecondaryBackgroundColor],
          ),
        ),
        //color: Colors.black,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'GYM ASSISTANT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 10,
                    color: Color(0x60FFFFFF),
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'GET FIT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 4,
                    color: Color(0x60FFFFFF),
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  //ToDo: Change Icons to something suitable and add their functionality.
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.add,
                      color: kPrimaryColor,
                    ),
                    Icon(
                      Icons.add,
                      color: kPrimaryColor,
                    ),
                    Icon(
                      Icons.add,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                source == null
                    ? Container(child: CupertinoActivityIndicator(radius: 50.0))
                    : Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: source.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: ExerciseCard(
                                  source[index].name,
                                  source[index].sets,
                                  source[index].reps,
                                  source[index].weight,
                                  source[index].isMetric),
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//ToDo: create another card template for Routines and Days.
class ExerciseCard extends StatelessWidget {
  final String label;
  final int sets;
  final int reps;
  final int weight;
  final bool isMetric;
  ExerciseCard(this.label, this.sets, this.reps, this.weight, this.isMetric);

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
                label.toUpperCase(),
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
                VolumeInputField('Sets', sets, (value) {
                  currentSets = value;
                }),
                Icon(Icons.close, color: kPrimaryColor),
                VolumeInputField('Reps', reps, (value) {
                  currentReps = value;
                }),
                Icon(Icons.close, color: kPrimaryColor),
                VolumeInputField('Weight', weight, (value) {
                  currentWeight = value;
                }),
                DropDownUnitSelector(currentIsMetric, label),
                //ToDo: Add a 'Save' Button to persist values to shared preferences when tapped.
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

class DropDownUnitSelector extends StatefulWidget {

  final bool isMetric;
  final String exerciseName;

  DropDownUnitSelector(this.isMetric, this.exerciseName);

  @override
  _DropDownUnitSelectorState createState() => _DropDownUnitSelectorState();
}

class _DropDownUnitSelectorState extends State<DropDownUnitSelector> {

  String dropDownValue;
  @override
  void initState() {
    super.initState();
    dropDownValue = widget.isMetric == true ? 'KGs' : 'LBs';
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: Colors.black),
      child: DropdownButton<String>(
        value: dropDownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.white),
        underline: Container(
          height: 0,
        ),
        onChanged: (String newValue) async {
          setState(() {
            dropDownValue = newValue;
          });
          print(widget.exerciseName);
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('${widget.exerciseName} isMetric', newValue == 'LBs' ? false : true);
        },
        items: <String>['KGs', 'LBs']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}