import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:visistafri/models/signup.model.dart';
import 'package:visistafri/views/pass.view.dart';
import 'package:visistafri/views/home.view.dart';
import 'package:visistafri/views/signup.views.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController etemail = new TextEditingController();
  TextEditingController etpassword = new TextEditingController();

  List<Info> myinfo = [
    new Info("Sandrine Umurerwawase", "sando@gmail.com", "12345", "12345"),
    new Info("Diane Ngonga", "diane@gmail.com", "diane123", "diane123"),
    new Info("Rita Hategekima", "rita@gmail.com", "rita2000", "rita2000"),
    new Info("Floride Tuyisenge", "fofo@gmail", "12345678", "12345678"),
    new Info("John Mugiraneza", "mujohn25@gmail.com", "1234578", "1234578"),
  ];
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
              Image.asset("assets/images/Group 3.png",
                  fit: BoxFit.contain, width: 700.0),
              Padding(
                padding: const EdgeInsets.only(top: 180.0, left: 30.0),
                child: Text(
                  'Sign In',
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
                padding: const EdgeInsets.only(top: 210.0, left: 30.0),
                child: Text(
                  'Sign in with your email',
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
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
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
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
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
              Padding(
                padding: const EdgeInsets.only(left: 200.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Forgetpass()));
                  },
                  child: Text(
                    'Forget Password?',
                    style: TextStyle(
                      color: Color(0xffB15C1E),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 145.0),
                child: Container(
                  child: MaterialButton(
                    color: Color(0xffB15C1E),
                    textColor: Colors.white,
                    child: Text('Sign in'),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        dynamic list = myinfo.where((item) =>
                            item.email == etemail.text &&
                            item.password == etpassword.text);
                        if (list.length > 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Homepage(login: "${etemail.text}")));
                        } else {
                          Fluttertoast.showToast(
                              msg: "The email or password not exist.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM);
                          return;
                        }
                      }
                    },
                    minWidth: 150,
                    height: 40.0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Column(
                  children: [
                    SignInButton(
                      Buttons.Facebook,
                      text: "Sign in Facebook",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                child: Column(
                  children: [
                    SignInButton(
                      Buttons.Google,
                      text: "Sign in Google",
                      onPressed: () {},
                    )
                  ],
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
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ]),
    )));
  }
}
