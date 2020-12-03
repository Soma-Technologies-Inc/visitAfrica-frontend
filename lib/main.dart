import 'package:flutter/material.dart';
import 'models/mostVisited.models.dart';
import 'views/SpecificCountry.view.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      home: SpecificCountry(
        place: Place(
          'Nyugwe National Park',
          "assets/images/park3.jpg",
          'Nyamagabe',
          'Nyugwe National Park',
        ),
      ),
    ),
  );
}
