import 'package:get_ripped/exercise.dart';

class Day{
  String name;
  List<Exercise> exercises;

  Exercise getChild (int index){
    return exercises[index];
  }

  Day(this.name, this.exercises);

}