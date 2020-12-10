import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:visistafri/models/booknow.model.dart';

import 'edithotel.view.dart';

class Notifyhotel extends StatefulWidget {
  final thehall;
  final List<Booknow> notifyhotel;
  final String title;
  final bool isupdate;
  const Notifyhotel({
    Key key,
    this.notifyhotel,
    this.thehall,
    this.title,
    this.isupdate = false,
  }) : super(key: key);
  @override
  _NotifyhotelState createState() => _NotifyhotelState();
}

class _NotifyhotelState extends State<Notifyhotel> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (widget.isupdate)
        Flushbar(
          title: "Request Edited Successfully",
          message: "Thank you for updating booking requests",
          duration: Duration(seconds: 3),
        )..show(context);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.notifyhotel.length,
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
                    Text("Phone : " + widget.notifyhotel[index].phonenumber),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(left: 20.0, top: 10.0),
                child: Row(
                  children: <Widget>[
                    Text("Number of people:" +
                        widget.notifyhotel[index].numberofpeople),
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
                    Text(
                        "Arrival Date : " + widget.notifyhotel[index].datefrom),
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
                          builder: (context) => EditHotelRequest(
                                myphonenumber:
                                    widget.notifyhotel[index].phonenumber,
                                mynumberofpeople:
                                    widget.notifyhotel[index].numberofpeople,
                                mydatefrom: widget.notifyhotel[index].datefrom,
                                mydateto: widget.notifyhotel[index].dateto,
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
