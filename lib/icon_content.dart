import 'package:flutter/material.dart';
class GenderCard extends StatelessWidget {
  GenderCard({@required this.gender,@required this.genderIcon});
  final String gender;
  final IconData genderIcon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}