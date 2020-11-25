import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:visistafri/utils/screen_size.dart';
import 'package:visistafri/views/signup.view.dart';
import 'package:visistafri/widgets/button.widget.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              Image.asset("assets/images/cover.png",
                  width: double.infinity,
                  height: ScreenSize.defaultSize * 58,
                  fit: BoxFit.cover),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, bottom: 290.0),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      height: ScreenSize.defaultSize * 0.1,
                      fontSize: 24.0,
                      color: Color(0xff7B0F0F),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenSize.defaultSize * 50,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, bottom: 260.0),
                  child: Text(
                    'to',
                    style: TextStyle(
                      height: ScreenSize.defaultSize * 0.1,
                      fontSize: 14.0,
                      color: Color(0xff7B0F0F),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenSize.defaultSize * 50,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0, bottom: 260.0),
                  child: Text(
                    'Visit Africa',
                    style: TextStyle(
                      height: ScreenSize.defaultSize * 0.1,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff7B0F0F),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenSize.defaultSize * 50,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 30.0, bottom: 180.0, right: 100.0),
                  child: Text(
                    'Join us to explore the whole africa by visiting best places',
                    style: TextStyle(
                      fontSize: 13.0,
                      height: ScreenSize.defaultSize * 0.1,
                      color: Color(0xff7A7A7A),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenSize.defaultSize * 50,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, bottom: 64.0),
                  child: Button(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (BuildContext context) => Signup(),
                        ),
                      );
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
