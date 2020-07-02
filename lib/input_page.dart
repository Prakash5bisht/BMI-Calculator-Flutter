import 'package:bmicalculator/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/reusable_card.dart';
import 'reusable_container_child.dart';
import 'package:bmicalculator/constants.dart';
import 'custom_round_button.dart';
import 'bmi_calculation.dart';
import 'dart:async';

enum Gender {
  male,
  Female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 10;
  Timer timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male
                            ? Color(0xffe6ecff)
                            : kCardColor,
                        reusableContainerChild: ReusableContainerChild(
                          iconData: FontAwesomeIcons.mars,
                          text: 'MALE',
                          iconColor: selectedGender == Gender.male
                              ? Colors.blueAccent
                              : kIconColor,
                          newTextColor: selectedGender == Gender.male
                              ? Colors.blueAccent
                              : kIconColor,
                        ),
                        shadowColor: selectedGender == Gender.male ? kShadowColor : Colors.blue[50],
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.Female;
                          });
                        },
                        colour: selectedGender == Gender.Female
                            ? Color(0xffedf7ee)
                            : kCardColor,
                        reusableContainerChild: ReusableContainerChild(
                          iconData: FontAwesomeIcons.venus,
                          text: 'FEMALE',
                          iconColor: selectedGender == Gender.Female
                              ? Colors.green[300]
                              : kIconColor,
                          newTextColor: selectedGender == Gender.Female
                              ? Colors.green[300]
                              : kIconColor,
                        ),
                        shadowColor: selectedGender == Gender.Female ? kShadowColor : Colors.green[50],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        colour: kCardColor,
                        shadowColor: kShadowColor,
                        reusableContainerChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'HEIGHT',
                              style: TextStyle(
                                color: kTextColor,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  height.toString(),
                                  style: kCustomTextStyle,
                                ),
                                Text(
                                  'cm',
                                  style: TextStyle(
                                    color: kTextColor,
                                  ),
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.red,
                                inactiveTrackColor: Colors.grey,
                                thumbColor: Colors.redAccent,
                                overlayColor: Color(0x26EF5350),
                              ),
                              child: Slider(
                                value: height.toDouble(),
                                min: 54.6,
                                max: 300.0,
                                onChanged: (double value) {
                                  setState(() {
                                    height = value.round();
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        colour: kCardColor,
                        shadowColor: kShadowColor,
                        reusableContainerChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                color: kTextColor,
                              ),
                            ),
                            Text(
                              weight.toString(),
                              style: kCustomTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CustomRoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight <= 0? weight = 0 : weight--;
                                    });
                                  },
                                  onHold: (LongPressStartDetails){
                                    timer = Timer.periodic(Duration(milliseconds: 100), (Timer t){
                                      setState(() {
                                        weight <= 0? weight = 0 : weight--;
                                      });
                                    });
                                  },
                                  onRelease: (LongPressEndDetails){
                                    setState(() {
                                      timer.cancel();
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                CustomRoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  onHold: (LongPressStartDetails){
                                    timer = Timer.periodic(Duration(milliseconds: 100), (Timer t){
                                      setState(() {
                                        weight++;
                                      });
                                    });
                                  } ,
                                  onRelease: (LongPressEndDetails){
                                    setState(() {
                                      timer.cancel();
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
                      child: ReusableCard(
                        colour: kCardColor,
                        shadowColor: kShadowColor,
                        reusableContainerChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'AGE',
                              style: TextStyle(
                                color: kTextColor,
                              ),
                            ),
                            Text(
                              age.toString(),
                              style: kCustomTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CustomRoundButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age<=1 ? age = 1 : age--;
                                    });
                                  },
                                  onHold: (LongPressStartDetails){
                                    timer = Timer.periodic(Duration(milliseconds: 100), (Timer t){
                                      setState(() {
                                        age <= 1? age = 1 : age--;
                                      });
                                    });
                                  },
                                  onRelease: (LongPressEndDetails){
                                    setState(() {
                                      timer.cancel();
                                    });
                                  },

                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                CustomRoundButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  onHold: (LongPressStartDetails){
                                    timer = Timer.periodic(Duration(milliseconds: 100), (Timer t){
                                      setState(() {
                                        age++;
                                      });
                                    });
                                  },
                                  onRelease: (LongPressEndDetails){
                                    setState(() {
                                      timer.cancel();
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
                  CalculateBmi Bmi = CalculateBmi(height, weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        Bmi.getResult(),
                        Bmi.getCondition(),
                        Bmi.getDescription(),
                      ),
                    ),
                  );
                },
                child: Container(
                  width: kBottomButtonWidth,
                  height: kBottomButtonHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: kBottomButtonColor,
                  ),
                  child: Center(
                    child: Text(
                      'CALCULATE YOUR BMI',
                      style: kBottomButtonStyle,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
