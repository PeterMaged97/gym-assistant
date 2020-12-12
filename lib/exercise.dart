import 'package:flutter/cupertino.dart';

class Exercise with ChangeNotifier{

  String name;
  int sets;
  int reps;
  int weight;
  bool isMetric;

  Exercise(this.name, this.sets, this.reps, this.weight, this.isMetric);

  void changeSets(int newValue){
    sets = newValue;
    notifyListeners();
  }
  void changeReps(int newValue){
    reps = newValue;
    notifyListeners();
  }
  void changeWeight(int newValue){
    weight = newValue;
    notifyListeners();
  }
  void changeUnits(bool newValue){
    isMetric = newValue;
    notifyListeners();
  }

}