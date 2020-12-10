import 'package:flutter/material.dart';

import 'package:visistafri/models/booktransport.model.dart';

import 'edittransport.view.dart';

class Notifytransport extends StatefulWidget {
  final thehall;
  final List<Booktransport> notifytransport;
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
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/Group 3.png",
                      width: 1000,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 230.0, left: 10.0),
                      child: Text(
                        'View Bookings Report',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 300.0, left: 10.0),
                      child: Text(
                        'Below is  the summary of your bookings ',
                        style: TextStyle(
                          color: Color(0xffB15C1E),
                          fontSize: 18.0,
                        ),
                      ),
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
                        widget.notifytransport[index].pickupdate),
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
                        widget.notifytransport[index].dropoffdate),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 150.0, top: 30),
                child: MaterialButton(
                  color: Color(0xffB15C1E),
                  height: 40,
                  minWidth: 142,
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: new Text(
                    'Edit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditTransportRequest(
                                myphonenumber:
                                    widget.notifytransport[index].phonenumber,
                                mypickupdate:
                                    widget.notifytransport[index].pickupdate,
                                mydropoffdate:
                                    widget.notifytransport[index].dropoffdate,
                              )),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
