import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:visistafri/utils/responsiviness.dart';
import 'package:visistafri/views/login.views.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:visistafri/models/signup.model.dart';
import 'package:visistafri/views/home.view.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController username = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController confirmPassword = new TextEditingController();

  List<Info> myinfo = [
    new Info("Sandrine Umurerwawase", "sando@gmail.com", "12345", "12345"),
    new Info("Diane Ngonga", "diane@gmail.com", "diane123", "diane123"),
    new Info("Rita Hategekima", "rita@gmail.com", "rita2000", "rita2000"),
    new Info("Floride Tuyisenge", "fofo@gmail", "12345678", "12345678"),
    new Info("John Mugiraneza", "mujohn25@gmail.com", "123", "123"),
  ];

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/Group 3.png",
                      width: double.infinity,
                      height: ScreenSize.defaultSize * 30,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 180.0, left: 35.0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 210.0, left: 30.0),
                      child: Text(
                        'Create your acount',
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
                        padding: EdgeInsets.only(
                          right: 30.0,
                          left: 30.0,
                        ),
                        child: TextFormField(
                          controller: username,
                          decoration: InputDecoration(
                            hintText: 'Full name',
                          ),
                          validator: (username) {
                            if (username.isEmpty) {
                              return "name can not be empty";
                            } else
                              return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          right: 30.0,
                          left: 30.0,
                        ),
                        child: TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: 'Email',
                          ),
                          validator: (email) {
                            if (email.isEmpty) {
                              return "email can not be empty";
                            } else if (!RegExp(
                                    r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                .hasMatch(email)) {
                              return "Please enter valid input";
                            } else
                              return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          right: 30.0,
                          left: 30.0,
                        ),
                        child: TextFormField(
                          controller: password,
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
                          validator: (psw) {
                            if (psw.isEmpty) {
                              return "Password can not be empty";
                            } else if (psw.length <= 3) {
                              return "Password is short";
                            } else
                              return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          right: 30.0,
                          left: 30.0,
                        ),
                        child: TextFormField(
                          controller: confirmPassword,
                          decoration: InputDecoration(
                              hintText: 'Confirm password',
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
                          validator: (confirmpsw) {
                            if (confirmpsw.isEmpty) {
                              return "Please re-enter Password ";
                            } else if (password.text != confirmpsw) {
                              return "Password do not match";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 145.0, bottom: 30),
                        child: MaterialButton(
                          color: Color(0xffB15C1E),
                          textColor: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0)),
                          child: Text('Sign up'),
                          onPressed: () {
                            if (formKey.currentState.validate()) {
                              dynamic list = myinfo
                                  .where((item) => item.email == email.text);
                              if (list.length > 0) {
                                Fluttertoast.showToast(
                                    msg: "The email already exist.",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM);
                                return;
                              }

                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (BuildContext context) => Homepage(
                                    login: email.text,
                                  ),
                                ),
                              );
                            }
                          },
                          minWidth: 150,
                          height: 40.0,
                        ),
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
                            SizedBox(
                              height: 5.0,
                            ),
                            SignInButton(
                              Buttons.Google,
                              text: "Sign in Google",
                              onPressed: () {},
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 100.0),
                        child: Row(children: <Widget>[
                          Text(
                            'Already have an account? ',
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInView()));
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: Color(0xffB15C1E),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
