import 'package:flutter/material.dart';
import 'package:visistafri/views/EditProfile.view.dart';
//import 'views/welcome.view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditProfile(),
      theme: ThemeData(
        primaryColor: Colors.white,
        colorScheme: ColorScheme.light(primary: const Color(0xffB15C1E)),
      ),
    );
  }
}
