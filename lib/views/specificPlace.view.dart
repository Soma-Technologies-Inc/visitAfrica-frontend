import 'package:flutter/material.dart';
import 'package:visistafri/models/place.model.dart';
import 'package:visistafri/models/specifHotel.model.dart';
import 'package:visistafri/models/specificTransport.model.dart';
import 'package:visistafri/views/Bookhall.view.dart';
import 'package:visistafri/views/bookhotel.view.dart';

import 'package:visistafri/views/booktransport.view.dart';
import 'package:visistafri/views/mytourist.view.dart';

class Places extends StatefulWidget {
  final String placePicture;
  final String placeDisc;
  final String placeLocation;
  final String placeAddress;
  Places(
      {Key key,
      @required this.placeDisc,
      this.placeAddress,
      this.placePicture,
      this.placeLocation})
      : super(key: key);
  @override
  _PlacesState createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  List<SelectedPlace> place = [
    SelectedPlace(
      "",
      "",
      "",
      "",
    )
  ];
  List<Hotels> myhotel = [
    Hotels("assets/images/convetion.PNG", "Kigali Convention Center",
        "Location: Kigali Rwanda", "address"),
    Hotels("assets/images/onomo.PNG", " ONOMO Hotel ",
        "Location: Kigali Rwanda", "address"),
    Hotels("assets/images/park.PNG", "Parl Inn Center",
        "Location: Kigali Rwanda", "address"),
    Hotels("assets/images/radison.PNG", "Radison Blue",
        "Location: Kigali Rwanda", "address"),
    Hotels("assets/images/convetion.PNG", "Kigali Convention Center",
        "Location: Kigali Rwanda", "address"),
  ];
  List<Transport> mytransport = [
    Transport("assets/images/yegoCabs.PNG", "Moving is a stressful time",
        "YEGO Cabs"),
    Transport(
        "assets/images/visitBus.PNG",
        "Go Kigali City Tours are designed to give you an intimate view of Kigali on a fun, action-packed day. Our tours are a great way kick off your visit to Rwanda and learn about the country’s culture and history.",
        "Visit Rwanda Bus"),
    Transport(
        "assets/images/moveme.PNG",
        "Go Kigali City Tours are designed to give you an intimate view of Kigali on a fun, action-packed day. Our tours are a great way kick off your visit to Rwanda and learn about the country’s culture and history.",
        "MOVE ME"),
    Transport(
        "assets/images/visitBus.PNG",
        "Go Kigali City Tours are designed to give you an intimate view of Kigali on a fun, action-packed day. Our tours are a great way kick off your visit to Rwanda and learn about the country’s culture and history.",
        "Safari Com"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xffB15C1E)),
          elevation: 0,
          title: Text("Attractive Place",
              style: TextStyle(
                color: Color(0xffB15C1E),
              )),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 16),
              ListView.builder(
                  itemCount: place.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 164,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              widget.placePicture,
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 212,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.placeDisc,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xffB15C1E),
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                widget.placeLocation,
                                overflow: TextOverflow.clip,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                widget.placeAddress,
                                overflow: TextOverflow.clip,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  FlatButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(18.0),
                                    ),
                                    color: Color(0xffB15C1E),
                                    textColor: Colors.white,
                                    child: Text(
                                      'Book now',
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                widget.placeDisc ==
                                                        "Kigali Convention Center"
                                                    ? Bookhotel(
                                                        title: widget.placeDisc,
                                                      )
                                                    : widget.placeDisc ==
                                                            "Round Building"
                                                        ? Bookhotel(
                                                            title: widget
                                                                .placeDisc,
                                                          )
                                                        : widget.placeDisc ==
                                                                "Ubumwe Grand"
                                                            ? Bookhotel(
                                                                title: widget
                                                                    .placeDisc,
                                                              )
                                                            : Mytourist(
                                                                title: widget
                                                                    .placeDisc,
                                                              )),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                  Widget>[
                SizedBox(height: 20.0),
                Text('Nearby Services',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xffB15C1E),
                        fontWeight: FontWeight.bold)),
                DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          TabBar(
                            labelColor: Color(0xffB15C1E),
                            unselectedLabelColor: Colors.black,
                            indicatorColor: Color(0xffB15C1E),
                            tabs: [
                              Tab(text: 'HOTELS'),
                              Tab(text: 'TRANSPORT'),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: 400,
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.grey, width: 0.1))),
                              child: TabBarView(children: <Widget>[
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 174,
                                  child: ListView.builder(
                                      itemCount: myhotel.length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8,
                                          ),
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.asset(
                                                  myhotel[index].image,
                                                  fit: BoxFit.cover,
                                                  width: 120,
                                                  height: 100,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    myhotel[index].title,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xffB15C1E),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        (myhotel[index]
                                                            .location),
                                                      ),
                                                      MaterialButton(
                                                        color:
                                                            Color(0xffB15C1E),
                                                        textColor: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  18.0),
                                                        ),
                                                        child: Text('Book now'),
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  Myroom(
                                                                      title: myhotel[
                                                                              index]
                                                                          .title),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                                ListView.builder(
                                    itemCount: mytransport.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                mytransport[index].image,
                                                fit: BoxFit.cover,
                                                width: 120,
                                                height: 100,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  189,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    mytransport[index].title,
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      color: Color(0xffB15C1E),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        (mytransport[index]
                                                            .description),
                                                        maxLines: 1,
                                                      ),
                                                      MaterialButton(
                                                        color:
                                                            Color(0xffB15C1E),
                                                        textColor: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              new BorderRadius
                                                                      .circular(
                                                                  18.0),
                                                        ),
                                                        child: Text('Book now'),
                                                        onPressed: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  Mytransport(
                                                                title:
                                                                    mytransport[
                                                                            index]
                                                                        .title,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }),
                              ]))
                        ])),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
