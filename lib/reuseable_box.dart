import 'package:flutter/material.dart';

// extracts the widget auto by flutter
class ReuseableBox extends StatelessWidget {
  ReuseableBox({@required this.coloor, this.cardChild , this.onPress});
  final Color coloor;
  final Widget cardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: coloor,
      ),
    );
  }
}
