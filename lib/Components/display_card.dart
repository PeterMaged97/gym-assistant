import 'package:flutter/material.dart';
import '../constants.dart';

class DisplayCard extends StatelessWidget {
  final String label;
  final Function onTap;

  DisplayCard(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  label.toUpperCase(),
                  style: TextStyle(fontSize: 25, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: kTertiaryBackgroundColor),
      ),
    );
  }
}
