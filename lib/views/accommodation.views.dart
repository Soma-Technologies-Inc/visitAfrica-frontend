import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visistafri/models/accomodation.model.dart';
import 'package:visistafri/views/dataSaved.views.dart';
// import 'dart:io';    
// import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore    
// import 'package:image_picker/image_picker.dart'; // For Image Picker    
// import 'package:path/path.dart' as Path;  


class Accommodation extends StatefulWidget {
  @override
  _AccommodationState createState() => _AccommodationState();
}

class _AccommodationState extends State<Accommodation> {
  TextEditingController etindustryname = new TextEditingController();
  TextEditingController etlocation = new TextEditingController();
  TextEditingController etdecription = new TextEditingController();
  TextEditingController etspaces = new TextEditingController();
// File _image;    
// String _uploadedFileURL;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<String> _industry = [
    'Hotel',
    'Park facilities',
  ];

  String _selectedIndustry;
  String _service;

  bool _isChecked = false;
  bool _isChecke = false;
  bool _isCheck = false;
  bool _isChec = false;

  String _currText = '';

  List<String> text = ["Confrence Halls"];
  List<String> text1 = ["Rooms"];
  List<String> text2 = ["Pool"];
  var tmpArray = ["Transport"];

  List<String> myTmpArray = [];

  Info task = Info("", "", "", "", null);
  List<Info> myarray = [];

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
              Padding(
                padding: const EdgeInsets.only(top: 180.0, left: 30.0),
                child: Text(
                  'Accommodation',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 210.0, left: 30.0),
                child: Text(
                  'Please register your\naccommodation & facilites',
                  style: TextStyle(
                    color: Color(0xffB15C1E),
                    fontSize: 17.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 230.0),
                child: Image.asset(
                  "assets/images/upload.png",
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 195.0),
          child: Container(
            child: Text(
              'Upload image',
              style: TextStyle(
                fontSize: 17.0,
              ),
            ),
          ),
        ),
        Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 10),
                child: DropdownButton(
                  isExpanded: true,
                  hint: Text('Please select hospitality industry'),
                  value: _selectedIndustry,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedIndustry = newValue;
                    });
                  },
                  items: _industry.map((industryname) {
                    return DropdownMenuItem(
                      child: new Text(industryname),
                      value: industryname,
                    );
                  }).toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                    controller: etdecription,
                    decoration: InputDecoration(
                      hintText: 'Description',
                    ),
                    validator: (etdecription) {
                      if (etdecription.isEmpty) {
                        return "Please provide availabe spaces";
                      } else
                        return null;
                    }),
              ),
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                    controller: etlocation,
                    decoration: InputDecoration(
                      hintText: 'Location',
                    ),
                    validator: (etlocation) {
                      if (etlocation.isEmpty) {
                        return "Please provide availabe spaces";
                      } else
                        return null;
                    }),
              ),
              Container(
                padding: EdgeInsets.only(right: 125.0, top: 20.0),
                child: Text(
                  'Select service provided',
                  style: TextStyle(
                    fontSize: 17.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 30.0),
                child: Container(
                  child: Column(
                    children: text
                        .map((t) => CheckboxListTile(
                              title: Text(t),
                              controlAffinity: ListTileControlAffinity.leading,
                              value: _isChecked,
                              activeColor: Color(0xffB15C1E),
                              onChanged: (val) {
                                setState(() {
                                  _isChecked = val;
                                });
                                if (_isChecked == true) {
                                  myTmpArray.add(t);
                                } else {
                                  myTmpArray.removeWhere((item) => item == t);
                                }
                              },
                            ))
                        .toList(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 30.0),
                child: Container(
                  child: Column(
                    children: text1
                        .map((t1) => CheckboxListTile(
                              title: Text(t1),
                              controlAffinity: ListTileControlAffinity.leading,
                              value: _isChecke,
                              activeColor: Color(0xffB15C1E),
                              onChanged: (val) {
                                setState(() {
                                  _isChecke = val;
                                });
                                if (_isChecke == true) {
                                  myTmpArray.add(t1);
                                } else {
                                  myTmpArray.removeWhere((item) => item == t1);
                                }
                              },
                            ))
                        .toList(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 30.0),
                child: Container(
                  child: Column(
                    children: text2
                        .map((t2) => CheckboxListTile(
                              title: Text(t2),
                              controlAffinity: ListTileControlAffinity.leading,
                              value: _isCheck,
                              activeColor: Color(0xffB15C1E),
                              onChanged: (val) {
                                setState(() {
                                  _isCheck = val;
                                });
                                if (_isCheck == true) {
                                  myTmpArray.add(t2);
                                } else {
                                  myTmpArray.removeWhere((item) => item == t2);
                                }
                              },
                            ))
                        .toList(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 30.0),
                child: Container(
                  child: Column(
                    children: tmpArray
                        .map((t3) => CheckboxListTile(
                              title: Text(t3),
                              controlAffinity: ListTileControlAffinity.leading,
                              value: _isChec,
                              activeColor: Color(0xffB15C1E),
                              onChanged: (val) {
                                setState(() {
                                  _isChec = val;
                                });
                                if (_isChec == true) {
                                  myTmpArray.add(t3);
                                } else {
                                  myTmpArray.removeWhere((item) => item == t3);
                                }
                              },
                            ))
                        .toList(),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                  controller: etspaces,
                  decoration: InputDecoration(
                    hintText: 'Availabe spaces',
                  ),
                  validator: (etspaces) {
                    if (etspaces.isEmpty) {
                      return "Please provide available spaces";
                    } else if (!RegExp(
                            r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                        .hasMatch(etspaces)) {
                      return "Please enter only numbers";
                    } else
                      return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 145.0),
                child: Container(
                  child: MaterialButton(
                    color: Color(0xffB15C1E),
                    textColor: Colors.white,
                    child: Text('Register'),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        myarray.add(Info(
                            etdecription.text,
                            etlocation.text,
                            etspaces.text,
                            _selectedIndustry,
                            myTmpArray));

                        etlocation.clear();
                        etdecription.clear();
                        etspaces.clear();

                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (BuildContext context) => SavedData(
                              mydata: myarray,
                            ),
                          ),
                        );
                        setState(() {
                          _isChecked = _isChecke = _isCheck = _isChec = false;
                          _selectedIndustry = null;
                        });
                        myTmpArray = [];
                      }
                    },
                    minWidth: 150,
                    height: 40.0,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    )));
  }
}
