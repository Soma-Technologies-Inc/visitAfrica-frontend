import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:core';
import 'package:visistafri/views/bookhall.view.dart';
import 'package:visistafri/views/bookhotel.view.dart';
import 'package:visistafri/views/booktransport.view.dart';

class book extends StatelessWidget {
  var list = ["Convention Center"];
  var list2 = ["Kigali Marriot"];
  var list3 = ["Tembera Tours"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 150, bottom: 10, left: 100),
              child: RichText(
                text: TextSpan(children: <InlineSpan>[
                  for (var string in list)
                    TextSpan(
                        text: string, style: TextStyle(color: Colors.black)),
                ]),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) => Bookhotel(
                      title: list[0].toString(),
                    ),
                  ),
                );
              },
              child: Text(
                "Book Now",
                style: TextStyle(
                  color: Color(0xffB15C1E),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: RichText(
                text: TextSpan(children: <InlineSpan>[
                  for (var string in list2)
                    TextSpan(
                        text: string, style: TextStyle(color: Colors.black)),
                ]),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) => Myroom(
                      title: list2[0].toString(),
                    ),
                  ),
                );
              },
              child: Text(
                "Book Now",
                style: TextStyle(
                  color: Color(0xffB15C1E),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 160, top: 10),
              child: RichText(
                text: TextSpan(children: <InlineSpan>[
                  for (var string in list3)
                    TextSpan(
                        text: string, style: TextStyle(color: Colors.black)),
                ]),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (BuildContext context) => Mytransport(
                      title: list3[0].toString(),
                    ),
                  ),
                );
              },
              child: Text(
                "Book Now",
                style: TextStyle(
                  color: Color(0xffB15C1E),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}