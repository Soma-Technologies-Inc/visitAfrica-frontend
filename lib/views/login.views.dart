import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  TextEditingController etemail = new TextEditingController();
  TextEditingController etpassword = new TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Image.asset("assets/images/Group 3.png",
                  fit: BoxFit.contain, width: 700.0),
              Padding(
                padding: const EdgeInsets.only(top: 180.0, left: 30.0),
                child: Text(
                  'Accommodation',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 210.0, left: 30.0),
                child: Text(
                  'Register your hospitality industry',
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
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                  controller: etpassword,
                  decoration: InputDecoration(
                      hintText: 'Hospitaliy Industry',
                     ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                  controller: etpassword,
                  decoration: InputDecoration(
                      hintText: 'Description',
                     ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 145.0),
                child: Container(
                  child: MaterialButton(
                    color: Color(0xffB15C1E),
                    textColor: Colors.white,
                    child: Text('Register'),
                    onPressed: () {
                    },
                    minWidth: 150,
                    height: 40.0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    )));
  }
}
