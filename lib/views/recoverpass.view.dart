import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:visistafri/views/login.views.dart';
import 'package:visistafri/views/signup.views.dart';

class Recoverpass extends StatefulWidget {
  @override
  _RecoverState createState() => _RecoverState();
}

class _RecoverState extends State<Recoverpass> {
  TextEditingController etpassword = new TextEditingController();
  TextEditingController etcomfirmpassword = new TextEditingController();

  bool showPassword = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  'Reset Password',
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
                  'Please reset your password',
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
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 40.0),
                child: Container(
                  padding: EdgeInsets.only(
                    right: 17.0,
                    left: 17.0,
                  ),
                  child: TextFormField(
                    controller: etpassword,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                            icon: Icon(showPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            })),
                    obscureText: !showPassword,
                    validator: (etpassword) {
                      if (etpassword.isEmpty) {
                        return "Password can not be empty";
                      } else if (etpassword.length <= 3) {
                        return "Password is short";
                      } else
                        return null;
                    },
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  right: 17.0,
                  left: 17.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: TextFormField(
                    controller: etcomfirmpassword,
                    decoration: InputDecoration(
                        hintText: 'Comfirm Password',
                        suffixIcon: IconButton(
                            icon: Icon(showPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            })),
                    obscureText: true,
                    validator: (etcomfirmpassword) {
                      if (etcomfirmpassword.isEmpty) {
                        return "Please re-enter Password ";
                      } else if (etpassword.text != etcomfirmpassword) {
                        return "Password do not match";
                      } else {
                        return null;
                      }
                    },
                  ),
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
                      etpassword.clear();
                      etcomfirmpassword.clear();
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (BuildContext context) => SignInView(),
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
                  child: Text('Reset'),
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
