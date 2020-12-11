import 'package:flutter/material.dart';
import 'package:visistafri/models/booknow.model.dart';

class Tourist extends StatefulWidget {
  final List<Booknow> notifytourist;
  final String title;
  const Tourist({
    Key key,
    this.notifytourist,
    this.title,
  }) : super(key: key);
  @override
  _TouristState createState() => _TouristState();
}

class _TouristState extends State<Tourist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.notifytourist.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(left: 20.0, top: 30.0),
                child: Row(
                  children: <Widget>[
                    Text("Your reservation summary at ${widget.title}"),
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
                    Text("Phone : " + widget.notifytourist[index].phonenumber),
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
                    Text("Arrival date and time: " +
                        widget.notifytourist[index].pickuptime),
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
                    Text("Leaving date and time: " +
                        widget.notifytourist[index].dropofftime),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
