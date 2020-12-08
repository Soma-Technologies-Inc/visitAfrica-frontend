import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visistafri/models/accomodation.model.dart';
import 'package:visistafri/views/dataSaved.views.dart';

class Accommodation extends StatefulWidget {
  @override
  _AccommodationState createState() => _AccommodationState();
}

class _AccommodationState extends State<Accommodation> {
  TextEditingController etindustryname = new TextEditingController();
  TextEditingController etlocation = new TextEditingController();
  TextEditingController etdecription = new TextEditingController();
  TextEditingController etspaces = new TextEditingController();
  TextEditingController t = new TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<String> _industry = [
    'Hotel',
    'Park',
  ];

  String _selectedIndustry;

  bool _isChecked = false;
  bool _isChecke = false;
  bool _isCheck = false;

  String _currText = '';
  String _currText1 = '';
  String _currText2 = '';

  List<String> text = ["Confrence Halls"];
  List<String> text1 = ["Rooms"];
  List<String> text2 = ["Pool"];
  var tmpArray = ["Transport"];

  Info task = Info("", "", "", "");
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
                  'Please register your\naccommodation and facilites',
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
                  items: _industry.map((etindustryname) {
                    return DropdownMenuItem(
                      child: new Text(etindustryname),
                      value: etindustryname,
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
                                  if (val == true) {
                                    _currText = t;
                                  }
                                });
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
                                  if (val == true) {
                                    _currText1 = t1;
                                  }
                                });
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
                                  if (val == true) {
                                    _currText2 = t2;

                                  }
                                });
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
                        .map((t2) => CheckboxListTile(
                              title: Text(t2),
                              controlAffinity: ListTileControlAffinity.leading,
                              value: _isCheck,
                              activeColor: Color(0xffB15C1E),
                              onChanged: (val) {
                                setState(() {
                                  _isCheck = val;
                                  if (val == true) {
                                    _currText2 = t2;
                                  }
                                });
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
                        return "Please provide availabe spaces";
                      } else
                        return null;
                    }),
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
                          etindustryname.text,
                          etdecription.text,
                          etlocation.text,
                          etspaces.text,
                        ));

                        etlocation.clear();
                        etdecription.clear();
                        etindustryname.clear();
                        etspaces.clear();

                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (BuildContext context) => SavedData(
                              mydata: myarray,
                              thehall: _selectedIndustry,
                              service: text,
                              service1: text1,
                              service2: tmpArray,
                            ),
                          ),
                        );
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
