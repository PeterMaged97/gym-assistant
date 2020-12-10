import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_ripped/Screens/home_screen.dart';

void main() {
  runApp(GetRipped());
}

void loadData(){
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
