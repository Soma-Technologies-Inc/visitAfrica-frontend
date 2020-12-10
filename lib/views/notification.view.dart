import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:visistafri/models/book.model.dart';

import 'edit.views.dart';

class Notifyme extends StatefulWidget {
  final thehall;
  final List<Bookingdetails> notify;

  final String myphone;
  final String myname;
  final String myemail;
  final String mytime;
  final bool isupdate;
  const Notifyme({
    Key key,
    this.notify,
    this.thehall,
    this.myphone,
    this.myname,
    this.myemail,
    this.mytime,
    this.isupdate = false,
  }) : super(key: key);
  @override
  _NotifymeState createState() => _NotifymeState();
}

class _NotifymeState extends State<Notifyme> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: widget.notify.length,
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
                    Text("Phone : " + widget.notify[index].phone,
                        style: TextStyle(fontSize: 16.0)),
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
                    Text("Hall Type : " + '${widget.thehall}',
                        style: TextStyle(fontSize: 16.0)),
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
                    Text("Chosen Time : " + widget.notify[index].time,
                        style: TextStyle(fontSize: 16.0)),
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
                    Text(widget.notify[index].timeTo),
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
                          builder: (context) => EditRequest(
                                myphone: widget.notify[index].phone,
                                mytime: widget.notify[index].time,
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
