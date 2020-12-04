import 'package:flutter/material.dart';
import 'package:get_ripped/Screens/home_screen.dart';

void main() {
  runApp(GetRipped());
}

class GetRipped extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => HomeScreen(),
      },
    );
  }
}