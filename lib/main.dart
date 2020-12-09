import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_ripped/Screens/home_screen.dart';

void main() {
  runApp(GetRipped());
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
