import 'package:flutter/material.dart';
import 'package:visistafri/models/models.dart';

class SignupView extends StatefulWidget {
  final List<Login> mydata;
  const SignupView({Key key, this.mydata}) : super(key: key);
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffB15C1E),
          title: Text('Sign up'),
        ),
        body: ListView.builder(
          itemCount: widget.mydata.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(left: 20.0, top: 30.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Email :   " + widget.mydata[index].email,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
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
                        Text(
                          "Password : " + widget.mydata[index].password,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
