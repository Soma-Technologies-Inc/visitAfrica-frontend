import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visistafri/models/requestcategories.models.dart';
import 'package:visistafri/models/staticbookingrequests.models.dart';
import 'package:visistafri/views/viewspecificrequest.views.dart';
import 'package:visistafri/widgets/smallbutton.widget.dart';

class ViewRequests extends StatefulWidget {
  @override
  _ViewRequestsState createState() => _ViewRequestsState();
}

class _ViewRequestsState extends State<ViewRequests> {
  int selectedIndex = 0;
  List<Requests> myrequestdetails = [
    Requests("Meeting Halls", [
      Requestdetails("Convention Center", "Sandrine Umurerwawase",
          "sando@gmail.com", "0787057826", "Big Sized Hall", "10:00-30/12/200"),
      Requestdetails(
          "Intare Conference Arena",
          "Sandrine Umurerwawase",
          "sando@gmail.com",
          "0787057826",
          "Medium Sized Hall",
          "10:00-331/12/200"),
      Requestdetails("Kigali Serena Hotel", "Sandrine Umurerwawase",
          "sando@gmail.com", "0787057826", "Big Sized Hall", "10:00-30/12/200"),
    ]),
    Requests("Hotels", [
      Requestdetails("Radison Blue", "Sandrine Umurerwawase", "sando@gmail.com",
          "0787057826", "Room No10", "12:00-20/12/2020"),
      Requestdetails("Park Inn", "Sandrine Umurerwawase", "sando@gmail.com",
          "0787057826", "Room No203", "12:00-20/12/2020"),
      Requestdetails("Kigali Serena Hotel", "Sandrine Umurerwawase",
          "sando@gmail.com", "0787057826", "Room No26", "12:00-20/12/2020"),
    ]),
    Requests("Transport", [
      Requestdetails("Tembera Tours", "Sandrine Umurerwawase",
          "sando@gmail.com", "0787057826", "Pick Nick Van", "12:00-20/12/2020"),
      Requestdetails("Safari Tours", "Sandrine Umurerwawase", "sando@gmail.com",
          "0787057826", "Range Rover", "12:00-20/12/2020"),
      Requestdetails("Tembera Tours", "Sandrine Umurerwawase",
          "sando@gmail.com", "0787057826", "PRADO", "12:00-20/12/2020"),
    ]),
    Requests("Volcanoes", [
      Requestdetails("", "", "", "", "", ""),
      Requestdetails("", "", "", "", "", ""),
      Requestdetails("", "", "", "", "", ""),
    ]),
    Requests("Parks", [
      Requestdetails("", "", "", "", "", ""),
      Requestdetails("", "", "", "", "", ""),
      Requestdetails("", "", "", "", "", ""),
    ]),
    Requests("Museums", [
      Requestdetails("", "", "", "", "", ""),
      Requestdetails("", "", "", "", "", ""),
      Requestdetails("", "", "", "", "", ""),
    ]),
  ];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Image.asset("assets/images/Group 3.png",
                  fit: BoxFit.contain, width: 700.0),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 120.0),
          child: Text(
            'View Bookings Report',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40.0, top: 20),
          child: Text(
            'Below is  the summary of your bookings ',
            style: TextStyle(
              color: Color(0xffB15C1E),
              fontSize: 18.0,
            ),
          ),
        ),
        Container(
          height: 57,
          padding: EdgeInsets.only(top: 20),
          child: ListView.builder(
            itemCount: myrequestdetails.length,
            padding: const EdgeInsets.only(left: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Mybutton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  color:
                      selectedIndex == index ? Color(0xffB15C1E) : Colors.white,
                  textColor:
                      selectedIndex == index ? Colors.white : Color(0xffB15C1E),
                  child: Text(
                    myrequestdetails[index].name,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(top: 10.0),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 100),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewSpecificRequest(
                                  rectitle: myrequestdetails[selectedIndex]
                                      .requestdetails[selectedIndex]
                                      .title,
                                  recphone: myrequestdetails[selectedIndex]
                                      .requestdetails[selectedIndex]
                                      .phone,
                                  rechall: myrequestdetails[selectedIndex]
                                      .requestdetails[selectedIndex]
                                      .hall,
                                  rectime: myrequestdetails[selectedIndex]
                                      .requestdetails[selectedIndex]
                                      .time,
                                )));
                  },
                  child: Text(
                      "Booked Place : " +
                          myrequestdetails[selectedIndex]
                              .requestdetails[0]
                              .title,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xffB15C1E),
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(top: 30.0, right: 50),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewSpecificRequest(
                                  rectitle: myrequestdetails[selectedIndex]
                                      .requestdetails[selectedIndex]
                                      .title,
                                  recphone: myrequestdetails[selectedIndex]
                                      .requestdetails[selectedIndex]
                                      .phone,
                                  rechall: myrequestdetails[selectedIndex]
                                      .requestdetails[selectedIndex]
                                      .hall,
                                  rectime: myrequestdetails[selectedIndex]
                                      .requestdetails[selectedIndex]
                                      .time,
                                )));
                  },
                  child: Text(
                      "Booked Place : " +
                          myrequestdetails[selectedIndex]
                              .requestdetails[1]
                              .title,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xffB15C1E),
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(top: 30.0, right: 90),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewSpecificRequest(
                                  rectitle: myrequestdetails[selectedIndex]
                                      .requestdetails[selectedIndex]
                                      .title,
                                  recphone: myrequestdetails[selectedIndex]
                                      .requestdetails[selectedIndex]
                                      .phone,
                                  rechall: myrequestdetails[selectedIndex]
                                      .requestdetails[selectedIndex]
                                      .hall,
                                  rectime: myrequestdetails[selectedIndex]
                                      .requestdetails[selectedIndex]
                                      .time,
                                )));
                  },
                  child: Text(
                      "Booked Place : " +
                          myrequestdetails[selectedIndex]
                              .requestdetails[2]
                              .title,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xffB15C1E),
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ],
          ),
        ),
      ]),
    )));
  }
}
