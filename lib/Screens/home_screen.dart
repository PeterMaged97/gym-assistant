import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_ripped/Components/display_card.dart';
import 'package:get_ripped/Components/exercise_card.dart';
import 'package:get_ripped/constants.dart';
import 'package:get_ripped/routine.dart';
import 'package:get_ripped/routine_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  final List<Routine> routines;

  HomeScreen(this.routines);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  kListLevel currentLevel;
  dynamic source;
  int i;

  @override
  void initState() {
    super.initState();
    currentLevel = kListLevel.Routine;
    source = widget.routines;
  }

  onBack(){
    if(currentLevel == kListLevel.Exercise){
      setState(() {
          currentLevel = kListLevel.Day;
          print(i);
          source = widget.routines[i].days;
      });
    }else if(currentLevel == kListLevel.Day){
      setState(() {
        currentLevel = kListLevel.Routine;
        source = widget.routines;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        onBack();
        return false;
        },
      child: Material(
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
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            currentLevel = kListLevel.Routine;
                            source = widget.routines;
                          });
                        },
                        child: Icon(
                          Icons.add,
                          color: currentLevel == kListLevel.Routine
                              ? Colors.white
                              : kPrimaryColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            if (currentLevel == kListLevel.Exercise){
                              currentLevel = kListLevel.Day;
                              print(i);
                              source = widget.routines[i].days;
                            }
                          });
                        },
                        child: Icon(
                          Icons.add,
                          color: currentLevel == kListLevel.Day
                              ? Colors.white
                              : kPrimaryColor,
                        ),
                      ),
                      Icon(
                        Icons.add,
                        color: currentLevel == kListLevel.Exercise
                            ? Colors.white
                            : kPrimaryColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  source == null
                      ? Container(child: CupertinoActivityIndicator(radius: 50.0))
                      : Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: source.length,
                            itemBuilder: (context, index) {
                              Widget w;

                              if (currentLevel == kListLevel.Exercise) {
                                w = ExerciseCard(
                                    source[index].name,
                                    source[index].sets,
                                    source[index].reps,
                                    source[index].weight,
                                    source[index].isMetric);
                              } else {
                                w = DisplayCard(source[index].name, () {
                                  setState(() {
                                    source = currentLevel == kListLevel.Routine ? source[index].days : source[index].exercises;
                                    if (currentLevel == kListLevel.Routine) {
                                      i = index;
                                      currentLevel = kListLevel.Day;
                                    } else if(currentLevel == kListLevel.Day) {
                                      currentLevel = kListLevel.Exercise;
                                    }
                                  });
                                });
                              }

                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: w,
                              );
                            },
                          ),
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
