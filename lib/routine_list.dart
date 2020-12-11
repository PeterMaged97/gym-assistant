import 'package:flutter/cupertino.dart';
import 'package:get_ripped/routine.dart';

class RoutineList with ChangeNotifier{
  List<Routine> routines;
  RoutineList(this.routines);
}