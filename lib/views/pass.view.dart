import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Forgetpass extends StatefulWidget {
  final String mostvisted;
  final String image;

  Forgetpass({Key key, @required this.mostvisted, this.image,})
      : super(key: key);
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Forgetpass> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController etemail = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Image.asset(widget.image),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(
              left: 20.0,
              top: 10.0,
            ),
            child: Row(
              children: <Widget>[
                Text(widget.mostvisted),
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
