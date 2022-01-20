

import 'package:flutter/material.dart';
import 'constants.dart';
import 'reuseable_box.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResult,@required  this.intre,@required  this.type});
  final String bmiResult; //number
  final String intre; //line
  final String type; //under-over

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Your Result',
                style: numberTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableBox(
              coloor: activeCart,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    type,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    intre,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Text(
                ' BACK T0 CALCULATOR',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 20),
              color: Colors.teal,
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              width: double.infinity,
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}
