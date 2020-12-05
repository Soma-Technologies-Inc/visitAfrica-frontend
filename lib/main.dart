import 'package:flutter/material.dart';
//import 'views/welcome.view.dart';
import 'views/editProfile.view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: WelcomeView(),
      home: EditProfile(),
      theme: ThemeData(primaryColor: Color(0xffB15C1E)),
    );
  }
}
