import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_ripped/Screens/home_screen.dart';
import 'package:get_ripped/constants.dart';
import 'package:get_ripped/exercise.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(GetRipped());
}

void loadData() async {
  final prefs = await SharedPreferences.getInstance();
  for (String exerciseName in kExerciseNames){
    int sets = prefs.getInt('$exerciseName sets') ?? 0;
    int reps = prefs.getInt('$exerciseName reps') ?? 0;
    int weight = prefs.getInt('$exerciseName weight') ?? 0;
    bool isMetric  = prefs.getBool('$exerciseName isMetric') ?? true;

    Exercise e = Exercise(exerciseName.toUpperCase(), sets, reps, weight, isMetric);

  }
  //ToDo: Loop over all exercise names, load 'sets', 'reps', and 'weight' (put a default 0 if they don't exist) and initialize objects for them.
  //ToDo: after loading all exercises, create days containing list of exercises and routines containing list of days.
}

class GetRipped extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: Color(0x00000000)));
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => HomeScreen(),
      },
    );
  }
}
