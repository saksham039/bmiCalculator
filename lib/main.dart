
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_box.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calcua=lator_brain.dart';

enum GenderType { male, female }

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCard;
  Color femaleCardColor = inactiveCard;
//using enum for the gender spicification
  void updateColor(GenderType gender) {
    if (gender == GenderType.male) {
      if (maleCardColor == inactiveCard) {
        maleCardColor = activeCart;
        femaleCardColor = inactiveCard;
      } else {
        maleCardColor = inactiveCard;
      }
    } else {
      if (femaleCardColor == inactiveCard) {
        femaleCardColor = activeCart;
        maleCardColor = inactiveCard;
      } else {
        femaleCardColor = inactiveCard;
      }
    }
  }

  int age = 18;
  int height = 180;
  int weight = 60;

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
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(GenderType.male);
                      });
                    },
                    child: ReuseableBox(
                      coloor: maleCardColor,
                      cardChild: GenderCard(
                        gender: 'MALE',
                        genderIcon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor(GenderType.female);
                      });
                    },
                    child: ReuseableBox(
                      coloor: femaleCardColor,
                      cardChild: GenderCard(
                        gender: 'FEMALE',
                        genderIcon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReuseableBox(
              coloor: activeCart,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 100.0,
                    max: 250.0,
                    onChanged: (double valueHeight) {
                      setState(() {
                        height = valueHeight.toInt();
                      });
                    },
                    thumbColor: Colors.white,
                    activeColor: Colors.teal,
                    inactiveColor: Colors.teal[100],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReuseableBox(
                    coloor: activeCart,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: 'btn1',
                              child: Icon(Icons.minimize_outlined),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            FloatingActionButton(
                              heroTag: 'btn2',
                              child: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReuseableBox(
                    coloor: activeCart,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              heroTag: 'btn3',
                              child: Icon(Icons.minimize_outlined),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            FloatingActionButton(
                              heroTag: 'btn4',
                              child: Icon(Icons.add),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(heightt: height, weightt: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    intre: calc.interpret(),
                    type: calc.getResult(),
                  ),
                ),
              );
            },
            child: Container(
              child: Text(
                'CALCULATE',
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
          )
        ],
      ),
    );
  }
}
