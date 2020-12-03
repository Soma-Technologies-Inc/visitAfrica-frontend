import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final Color bordercolor;
  final double radius;
  final Color textColor;
  final Color color;
  Mybutton({
    Key key,
    @required this.onPressed,
    this.child,
    this.bordercolor = Colors.grey,
    this.radius = 18,
    this.color,
    this.textColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(color: bordercolor)),
      child: child,
      textColor: textColor,
      color: color,
    );
  }
}
