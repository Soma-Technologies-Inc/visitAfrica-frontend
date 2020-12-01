import 'package:flutter/material.dart';


import 'package:visistafri/views/signup.model.dart';

class SigninView extends StatefulWidget {
  final List<Info> signup;
  const SigninView({Key key, this.signup}) : super(key: key);

  @override
  _SigninViewState createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffB15C1E),
        title: Text('Sign in'),
      ),
      body: ListView.builder(
        itemCount: widget.signup.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(left: 20.0, top: 30.0),
                child: Row(
                  children: <Widget>[
                    Text("Full name :   " + widget.signup[index].name),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(
                  left: 20.0,
                  top: 10.0,
                ),
                child: Row(
                  children: <Widget>[
                    Text("Email : " + widget.signup[index].email),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(
                  left: 20.0,
                  top: 10.0,
                ),
               
              ),
            ],
          );
        },
      ),
    );
  }
}
