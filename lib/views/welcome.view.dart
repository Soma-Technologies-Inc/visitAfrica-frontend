import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:visistafri/utils/responsiviness.dart';
import 'package:visistafri/views/signup.views.dart';
import 'package:visistafri/widgets/button.widget.dart';

class WelcomeView extends StatelessWidget {
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
                    Image.asset("assets/images/mycover.png",
                        width: double.infinity,
                        height: ScreenSize.defaultSize * 58,
                        fit: BoxFit.cover),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 450.0),
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          height: ScreenSize.defaultSize * 0.1,
                          fontSize: 24.0,
                          color: Color(0xff7B0F0F),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenSize.defaultSize * 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 480.0),
                      child: Text(
                        'to',
                        style: TextStyle(
                          height: ScreenSize.defaultSize * 0.1,
                          fontSize: 14.0,
                          color: Color(0xff7B0F0F),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenSize.defaultSize * 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0, top: 480.0),
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
                    SizedBox(
                      height: ScreenSize.defaultSize * 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 30.0, top: 540.0, right: 100.0),
                      child: Text(
                        'Join us to explore the whole africa by visiting best places',
                        style: TextStyle(
                          fontSize: 13.0,
                          height: ScreenSize.defaultSize * 0.1,
                          color: Color(0xff7A7A7A),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: ScreenSize.defaultSize * 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, top: 620),
                      child: Button(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (BuildContext context) => SignupView(),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
