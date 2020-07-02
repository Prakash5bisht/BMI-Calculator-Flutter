import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(this.result, this.condition, this.description);
  final String result;
  final String condition;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Your Health',
                    style: TextStyle(
                        color: Color(0xff0E0E0E),
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: ReusableCard(
                  colour: Colors.white,
                  shadowColor: kShadowColor,
                  reusableContainerChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        condition.toUpperCase(),
                        style: kConditionStyle,
                      ),
                      Text(result, style: kBmiResultStyle),
                      Center(
                        child: Text(
                          description,
                          style: kDescriptionStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
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
                      'RE-CALCULATE YOUR BMI',
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
