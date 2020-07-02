import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.colour, this.reusableContainerChild,this.onPress,this.shadowColor});
  final Color colour;
  final Widget reusableContainerChild;
  final Function onPress;
  final Color shadowColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: reusableContainerChild,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 10.0,
              )]
        ),
      ),
    );
  }
}
