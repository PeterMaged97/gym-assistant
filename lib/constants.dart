import 'package:flutter/material.dart';

final Color kPrimaryBackgroundColor = Color(0xFF464F61);
final Color kSecondaryBackgroundColor = Color(0xFF292E38);
final Color kPrimaryColor = Color(0x60FFFFFF);
final Color kTertiaryBackgroundColor = Color(0xFF18181D);

final List<String> kExerciseNames = [
  'dumbbell flat bench press',
  'dumbbell inclined bench press',
  'chest fly (machine)',
  'dips',
  'unilateral dumbbell french',
  'cable triceps extensions',
  'shoulder press',
  'pulldown',
  'low row',
  'row (machine)',
  'pulldown (machine)',
  'lower back',
  'rear deltoids (machine)',
  'biceps curls',
  'biceps hammer',
  'leg press',
  'squats',
  'leg extensions',
  'leg curls',
  'sitting calves',
  'front laterals',
  'side laterals',
];

final Map<String, List<int>> kDayNames = {
  'Push': [0,1,2,3,4,5,6,20,21,],
  'Pull': [7,8,9,10,11,12,13,14],
  'Legs': [15,16,17,18,19],
  'Chest': [0,1,2,3],
  'Back': [7,8,9,10,11],
  'Shoulders': [6,12,20,21],
  'Arms': [4,5,13,14],
  'Upper Body': [0,1,2,4,6,7,8,12,13,14,21],
  'Lower Body': [15,16,17,18,19,11],
  'General': [0,1,3,4,6,7,8,12,13,15,19,21],
};

final  Map<String, List<int>> kRoutineNames = {
  'PPL': [0, 1, 2],
  'Bro Split': [3,4,5,6,2],
  'Upper Lower': [7,8],
  'General': [9],
};
