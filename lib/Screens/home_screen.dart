import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/services.dart';
import 'package:get_ripped/Components/expandable.dart';
import 'package:get_ripped/Components/volume_input_field.dart';
import 'package:get_ripped/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> dummy = ['a', 'b'];
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'GYM ASSISTANT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 10,
                    color: Color(0x60FFFFFF),
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'GET FIT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 4,
                    color: Color(0x60FFFFFF),
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.add,
                      color: kPrimaryColor,
                    ),
                    Icon(
                      Icons.add,
                      color: kPrimaryColor,
                    ),
                    Icon(
                      Icons.add,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'DUMBBELL BENCH PRESS',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  VolumeInputField('Sets'),
                                  Icon(Icons.close, color: kPrimaryColor),
                                  VolumeInputField('Reps'),
                                  Icon(Icons.close, color: kPrimaryColor),
                                  VolumeInputField('Weight'),
                                ],
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kTertiaryBackgroundColor),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}