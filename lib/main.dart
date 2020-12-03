import 'package:flutter/material.dart';
import 'views/welcome.view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeView(),
      theme: ThemeData(primaryColor: Color(0xffB15C1E)),
    );
  }
}
