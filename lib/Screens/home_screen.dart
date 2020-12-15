import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_ripped/Components/display_card.dart';
import 'package:get_ripped/constants.dart';
import 'package:get_ripped/routine_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dynamic source = Provider.of<RoutineList>(context).routines[0].days;

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
                  //ToDo: Change Icons to something suitable and add their functionality.
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
                // ToDo: Find a way to make the ListView Builder return either a DisplayCard or an ExerciseCard based on the source.
                source == null
                    ? Container(child: CupertinoActivityIndicator(radius: 50.0))
                    : Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: source.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: DisplayCard(source[index].name, () {
                                // ToDo: Add Navigation Between different hierarchies.
                              }),
                            );
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
