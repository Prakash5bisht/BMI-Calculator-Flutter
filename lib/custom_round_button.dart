import 'package:flutter/material.dart';
import 'constants.dart';

class CustomRoundButton extends StatelessWidget {
  @override
  CustomRoundButton({this.icon, this.onPressed,this.onHold,this.onRelease});
  final IconData icon;
  final Function onPressed;
  final Function onHold;
  final Function onRelease;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      onLongPressStart: onHold,
      onLongPressEnd: onRelease,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kTextColor,
          boxShadow: [
            BoxShadow(
              color: Color(0xff8c8c8c),
              blurRadius: 5.0,
              offset: Offset(2.0, 2.0 ),
            )
          ],
        ),
        width: 40.0,
        height: 40.0,
        child: Icon(icon,
          color: Colors.white,),
      ),
    );
  }
}
