import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final Color color;
  final Color textColor;
  final EdgeInsets padding;
  final double radius;

  Button({
    Key key,
    @required this.onPressed,
    this.child,
    this.color = const Color(0xffB15C1E),
    this.textColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
    this.radius = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      color: color,
      textColor: textColor,
      padding: padding,
      child: child,
    );
  }
}
