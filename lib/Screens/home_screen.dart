import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/services.dart';
import 'package:get_ripped/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [kPrimaryBackgroundColor, kSecondaryBackgroundColor],
          ),
        ),
        //color: Colors.black,
        child: SafeArea(
          child: Column(
              children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'GET RIPPED',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 10,
                      color: Color(0x60FFFFFF),
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'GET FIT',
                    //textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 4,
                      color: Color(0x60FFFFFF),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
