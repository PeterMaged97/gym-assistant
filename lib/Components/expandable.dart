import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ExpandableWrapper extends StatelessWidget {

  //needs an ExpandableButton to be expanded
  final Widget collapsed;
  //needs an ExpandableButton to be collapsed
  final Widget expanded;

  ExpandableWrapper({this.collapsed, this.expanded});

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      // <-- Provides ExpandableController to its children
      child: Expandable(
        collapsed: collapsed,
        expanded: expanded,
      ),
    );
  }
}
