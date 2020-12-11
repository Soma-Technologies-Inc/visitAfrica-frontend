import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visistafri/views/recoverpass.view.dart';
import 'package:visistafri/views/signup.views.dart';

class Forgetpass extends StatefulWidget {
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
      child: Column(children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Image.asset(
                "assets/images/Group 3.png",
                fit: BoxFit.contain,
                width: 700.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 210.0, left: 30.0),
                child: Text(
                  'Forgert Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 240.0, left: 30.0),
                child: Text(
                  'We will send a link to your \nemail to reset your password',
                  style: TextStyle(
                    color: Color(0xffB15C1E),
                    fontSize: 17.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
                child: TextFormField(
                  controller: etemail,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "email can not be empty";
                    } else if (!RegExp(
                            r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                        .hasMatch(value)) {
                      return "Please enter valid input";
                    } else
                      return null;
                  },
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 145.0),
                child: MaterialButton(
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      etemail.clear();
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (BuildContext context) => Recoverpass(),
                        ),
                      );
                    }
                  },
                  color: Color(0xffB15C1E),
                  minWidth: 150,
                  height: 40.0,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  textColor: Colors.white,
                  child: Text('Continue'),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 100.0),
                child: Row(children: <Widget>[
                  Text(
                    'Do not have an account? ',
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupView()));
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        color: Color(0xffB15C1E),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ]),
    )));
  }
}
