import 'package:flutter/material.dart';
import 'package:visistafri/models/feedback.models.dart';
import 'package:visistafri/views/feedbackMessage.view.dart';

class Feedbacks extends StatefulWidget {
  @override
  _FeedbacksState createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  List<MyFeedback> messageSent = [];
  MyFeedback fb = MyFeedback("", "");
  int id = 1;
  String radioButtonValue = "comments";

  TextEditingController feedbacks = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset("assets/images/Group 3.png"),
                    Padding(
                      padding: EdgeInsets.only(top: 200.0, left: 32.0),
                      child: Text(
                        "Feedback",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 230.0, left: 30.0, right: 110),
                      child: Text(
                        "We will love to hear your thoughts, suggestion, concerns or problem so that we can improve",
                        style: TextStyle(
                          color: Color(0xffB15C1E),
                          fontSize: 17.0,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'Feedback type',
                      style: TextStyle(fontSize: 20),
                    )),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(padding: EdgeInsets.only(left: 4)),
                  new Radio(
                      activeColor: Color(0xffB15C1E),
                      value: 1,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          radioButtonValue = "Comments";
                          id = 1;
                        });
                      }),
                  new Text(
                    'Comments',
                    style: new TextStyle(fontSize: 15.0),
                  ),
                  new Radio(
                      activeColor: Color(0xffB15C1E),
                      value: 2,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          radioButtonValue = "Suggestions";
                          id = 2;
                        });
                      }),
                  new Text(
                    'Suggestions',
                    style: new TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Radio(
                      activeColor: Color(0xffB15C1E),
                      value: 3,
                      groupValue: id,
                      onChanged: (val) {
                        setState(() {
                          radioButtonValue = "Questions";
                          id = 3;
                        });
                      }),
                  new Text(
                    'Questions',
                    style: new TextStyle(fontSize: 16.0),
                  ),
                ]),
                Container(
                    alignment: Alignment.bottomLeft,
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'Describe your Feedback',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(12),
                  child: TextFormField(
                      controller: feedbacks,
                      keyboardType: TextInputType.multiline,
                      maxLines: 8,
                      maxLength: 500,
                      validator: (feedbacks) {
                        if (feedbacks.isEmpty) {
                          return "Please, write your comment";
                        } else
                          return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Comments",
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xffB15C1E),
                            width: 3,
                          )))),
                ),
                FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    color: Color(0xffB15C1E),
                    onPressed: () {
                      messageSent.add(
                        MyFeedback(feedbacks.text, radioButtonValue.toString()),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Details(
                                    mymessage: messageSent,
                                  )));
                    },
                    child: Text(
                      "Send",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
