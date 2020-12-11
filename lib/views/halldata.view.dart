import 'package:flutter/material.dart';
import 'package:visistafri/models/booknow.model.dart';


class Notifyme extends StatefulWidget {
  final thehall;
  final List<Booknow> notify;
  final String title;

  const Notifyme({
    Key key,
    this.notify,
    this.thehall,
    this.title,
    
  }) : super(key: key);
  @override
  _NotifymeState createState() => _NotifymeState();
}

class _NotifymeState extends State<Notifyme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.notify.length,
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
                    Text("Phone : " + widget.notify[index].phonenumber),
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
                    Text("chosen Hall Type : " + '${widget.thehall}'),
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
                    Text("Chosen Time : " + widget.notify[index].datefrom),
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
