import 'package:flutter/material.dart';


class ReusableContainerChild extends StatelessWidget {
  ReusableContainerChild({this.iconData,this.text,this.iconColor,this.newTextColor});
  final IconData iconData;
  final String text;
  final iconColor;
  final newTextColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Icon(iconData,
            color: iconColor,
            size: 65.0,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            text,
            style: TextStyle(
                color: newTextColor,
                letterSpacing: 0.5
            ),
          ) ,
        )
      ],
    );
  }
}