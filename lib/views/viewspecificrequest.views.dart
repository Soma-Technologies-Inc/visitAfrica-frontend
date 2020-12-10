import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'edit.views.dart';

class ViewSpecificRequest extends StatefulWidget {
  final String myphone;
  final String myname;
  final String myemail;
  final String mytime;
  final String recphone;
  final String recname;
  final String recemail;
  final String rectime;
  final String rectitle;
  final String rechall;
  final bool isupdate;
  const ViewSpecificRequest({
    Key key,
    this.recphone,
    this.recemail,
    this.recname,
    this.rectime,
    this.rectitle,
    this.myphone,
    this.myname,
    this.myemail,
    this.mytime,
    this.rechall,
    this.isupdate = false,
  }) : super(key: key);
  @override
  _ViewSpecificRequestState createState() => _ViewSpecificRequestState();
}

class _ViewSpecificRequestState extends State<ViewSpecificRequest> {
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text("Booked Place : " + widget.rectitle,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xffB15C1E),
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, right: 50),
            child: Text("Phone Number : " + widget.recphone,
                style: TextStyle(fontSize: 16.0)),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, right: 80),
            child: Text("Hall Type : " + widget.rechall,
                style: TextStyle(fontSize: 16.0)),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, right: 90),
            child: Text("Time : " + widget.rectime,
                style: TextStyle(fontSize: 16.0)),
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
                            myphone: widget.recphone,
                            myhall: widget.rechall,
                            mytime: widget.rectime,
                          )),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
