import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_ripped/constants.dart';

class VolumeInputField extends StatelessWidget {

  VolumeInputField({this.hintText, this.currentValue, this.onChangedCallback, this.onEditingCompleteCallback});

  final String hintText;
  final int currentValue;
  final Function onEditingCompleteCallback;
  final Function onChangedCallback;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        onEditingComplete: onEditingCompleteCallback,
        onChanged: onChangedCallback,
        decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder(
              borderSide:
              BorderSide(color: Colors.white),
            ),
            hintText: hintText,
            hintStyle:
            TextStyle(color: kPrimaryColor)),
        controller: TextEditingController()..text = currentValue.toString(),
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        cursorColor: Colors.white,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
      ),
    );
  }
}
