import 'package:flutter/material.dart';
import 'package:visistafri/models/feedback.models.dart';

class Details extends StatefulWidget {
  final List<MyFeedback> mymessage;
  Details({Key key, this.mymessage}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
            itemCount: widget.mymessage.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(left: 20.0, top: 30.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Feedback :   " +
                              widget.mymessage[index].selectedButtpn,
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(
                      left: 20.0,
                      top: 10.0,
                    ),
                    child: Row(
                      children: <Widget>[
                        Text("Message : " + widget.mymessage[index].message,
                            maxLines: 2, style: TextStyle(fontSize: 20)),
                      ],
                    ),
                  ),
                ],
              ));
            }),
      ),
    );
  }
}
