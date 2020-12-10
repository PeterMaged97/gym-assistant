import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_ripped/constants.dart';

class VolumeInputField extends StatelessWidget {

  VolumeInputField(this.hintText, this.currentValue);

  final String hintText;
  final int currentValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
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
