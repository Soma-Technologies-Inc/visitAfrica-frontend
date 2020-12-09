import 'package:flutter/material.dart';
import 'package:visistafri/models/booknow.model.dart';

class Notifytransport extends StatefulWidget {
  final thehall;
  final List<Booknow> notifytransport;
  final String title;

  const Notifytransport({
    Key key,
    this.notifytransport,
    this.thehall,
    this.title,
  }) : super(key: key);
  @override
  _NotifytransportState createState() => _NotifytransportState();
}

class _NotifytransportState extends State<Notifytransport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.notifytransport.length,
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
                    Text(
                        "Phone : " + widget.notifytransport[index].phonenumber),
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
                    Text("chosen Car Type : " + '${widget.thehall}'),
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
                    Text("Time for Pick-Up: " +
                        widget.notifytransport[index].pickuptime),
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
                    Text("Time to drop-off: " +
                        widget.notifytransport[index].dropofftime),
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
