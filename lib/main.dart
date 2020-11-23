import 'package:flutter/material.dart';
import 'views/homepage.view.dart';

void main() {
  runApp(MaterialApp(
    title: 'Todos ',
    theme: ThemeData(primaryColor: Colors.red),
    home: Homepage(),
  ));
}
