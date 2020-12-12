import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DropDownUnitSelector extends StatefulWidget {

  final bool isMetric;
  final String exerciseName;

  DropDownUnitSelector(this.isMetric, this.exerciseName);

  @override
  _DropDownUnitSelectorState createState() => _DropDownUnitSelectorState();
}

class _DropDownUnitSelectorState extends State<DropDownUnitSelector> {

  String dropDownValue;
  @override
  void initState() {
    super.initState();
    dropDownValue = widget.isMetric == true ? 'KGs' : 'LBs';
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(canvasColor: Colors.black),
      child: DropdownButton<String>(
        value: dropDownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.white),
        underline: Container(
          height: 0,
        ),
        onChanged: (String newValue) async {
          setState(() {
            dropDownValue = newValue;
          });
          print(widget.exerciseName);
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('${widget.exerciseName} isMetric', newValue == 'LBs' ? false : true);
        },
        items: <String>['KGs', 'LBs']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}