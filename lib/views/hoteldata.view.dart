import 'package:flutter/material.dart';
import 'package:visistafri/models/booknow.model.dart';

class Notifyhotel extends StatefulWidget {
  final thehall;
  final List<Booknow> notifyhotel;
  final String title;

  const Notifyhotel({
    Key key,
    this.notifyhotel,
    this.thehall,
    this.title,
  }) : super(key: key);
  @override
  _NotifyhotelState createState() => _NotifyhotelState();
}

class _NotifyhotelState extends State<Notifyhotel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.notifyhotel.length,
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
                    Text("Phone : " + widget.notifyhotel[index].phonenumber),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(left: 20.0, top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "Number of people:" + widget.notifyhotel[index].numberofpeople),
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
                    Text("Chosen Room Type : " + '${widget.thehall}'),
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
                    Text("Arrival Date : " + widget.notifyhotel[index].datefrom),
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
                    Text("Leaving date: " + widget.notifyhotel[index].dateto),
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
