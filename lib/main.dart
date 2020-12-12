import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_ripped/Screens/home_screen.dart';
import 'package:get_ripped/constants.dart';
import 'package:get_ripped/day.dart';
import 'package:get_ripped/exercise.dart';
import 'package:get_ripped/routine.dart';
import 'package:get_ripped/routine_list.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(GetRipped());
}

Future<List<Routine>> loadData() async {
  final prefs = await SharedPreferences.getInstance();

  List<Exercise> exercises = [];
  List<Day> days = [];
  List<Routine> routines = [];

  for (String exerciseName in kExerciseNames){
    int sets = prefs.getInt('$exerciseName sets') ?? 0;
    int reps = prefs.getInt('$exerciseName reps') ?? 0;
    int weight = prefs.getInt('$exerciseName weight') ?? 0;
    bool isMetric  = prefs.getBool('$exerciseName isMetric') ?? true;

    exercises.add(Exercise(exerciseName, sets, reps, weight, isMetric));
  }
  kDayNames.forEach((key, value) {
    print(key);
    List<Exercise> e = [];
    for (int i in value) {
      print(exercises[i].name);
      e.add(exercises[i]);
    }
    days.add(Day(key, e));
  });

  kRoutineNames.forEach((key, value) {
    List<Day> d = [];
    for (int i in value) {
      d.add(days[i]);
    }
    routines.add(Routine(key, d));
  });
  return routines;
}

class GetRipped extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: Color(0x00000000)));
    return FutureProvider<RoutineList>(
      create: (BuildContext context) async {
        return RoutineList(await loadData());
      },
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/' : (context) => HomeScreen(),
        },
      ),
    );
  }
}
