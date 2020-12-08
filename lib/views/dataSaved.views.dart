import 'package:flutter/material.dart';
import 'package:visistafri/models/accomodation.model.dart';

class SavedData extends StatefulWidget {
  // final thehall;
  // final service;

  final List<Info> mydata;
  // const SavedData({Key key, this.mydata, this.thehall, this.service})
    const SavedData({Key key, this.mydata})

      : super(key: key);
  @override
  _SavedDataState createState() => _SavedDataState();
}

class _SavedDataState extends State<SavedData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffB15C1E),
          title: Text('Saved Data'),
        ),
        body: ListView.builder(
          itemCount: widget.mydata.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(left: 20.0, top: 30.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Hospitality Industry Name:   " + '${widget.mydata[index].hosiptality}',
                          style: TextStyle(
                            fontSize: 16.0,
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
                          "Description: " + widget.mydata[index].description,
                          style: TextStyle(
                            fontSize: 16.0,
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
                          "Location: " + widget.mydata[index].location,
                          style: TextStyle(
                            fontSize: 16.0,
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
                        Text("Service provided : " + '${widget.mydata[index].services}'),
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
                          "Space available: " + widget.mydata[index].spaces,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
