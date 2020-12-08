import 'package:flutter/material.dart';
import 'package:visistafri/views/accommodation.views.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Accommodation(),
      theme: ThemeData(primaryColor: Color(0xffB15C1E),
      colorScheme: ColorScheme.light(primary: const Color(0xffB15C1E)),
      ),
    );
  }
}
