import 'package:get_ripped/day.dart';

class Routine{
  String name;
  List<Day> days;

  Day getChild (int index){
    return days[index];
  }

  Routine(this.name, this.days);

}