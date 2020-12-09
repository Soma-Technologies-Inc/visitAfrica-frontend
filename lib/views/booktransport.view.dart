import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:visistafri/models/booknow.model.dart';
import 'package:visistafri/utils/responsiviness.dart';
import 'package:visistafri/views/transportdata.view.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class Mytransport extends StatefulWidget {
  final String title;

  const Mytransport({Key key, this.title}) : super(key: key);
  @override
  _MytransportState createState() => _MytransportState();
}

class _MytransportState extends State<Mytransport> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<String> _cars = [
    'Land Cruiser',
    'Toyota Prado',
    'Land Rover',
    'Safari Land Cruiser',
    'Coasta Bus',
    'Toyota',
  ];
  String _selectedcars;
  DateTime selectedDate = DateTime.now();
  TextEditingController phonenumber = new TextEditingController();
  TextEditingController numberofpeople = new TextEditingController();
  TextEditingController halltype = new TextEditingController();
  TextEditingController datefrom = new TextEditingController();
  TextEditingController dateto = new TextEditingController();
  TextEditingController pickuptime = new TextEditingController();
  TextEditingController dropofftime = new TextEditingController();
  Booknow booknow = Booknow("", "", "", "", "", "", "");
  List<Booknow> mybookdata = [];

  final format = DateFormat("yyyy-MM-dd HH:mm");
  var gethour;
  var gethourto;

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Image.asset(
                "assets/images/simg.png",
                width: 1000,
                height: ScreenSize.defaultSize * 26,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 170.0, left: 30.0),
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 200.0, left: 30.0),
                child: Text(
                  'to ${widget.title}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 240.0, left: 30.0),
                child: Text(
                  'Fill the form below to book a hall',
                  style: TextStyle(
                    color: Color(0xffB15C1E),
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 10),
                child: TextFormField(
                  controller: phonenumber,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Your Phone Number',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please provide your phone number";
                    } else if (!RegExp(
                            r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                        .hasMatch(value)) {
                      return "Please enter valid phone number";
                    } else
                      return null;
                  },
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 10),
                child: DropdownButton(
                  isExpanded: true,
                  hint: Text('Please select type of car you want '),
                  value: _selectedcars,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedcars = newValue;
                    });
                  },
                  items: _cars.map((cars) {
                    return DropdownMenuItem(
                      child: new Text(cars),
                      value: cars,
                    );
                  }).toList(),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: Column(children: <Widget>[
                    DateTimeField(
                      format: format,
                      controller: pickuptime,
                      decoration: InputDecoration(
                        hintText: 'Tap to select Pick-Up date',
                      ),
                      validator: (DateTime dateTime) {
                        if (dateTime == null) {
                          return "Please tap to select Pick-Up date ";
                        }
                        return null;
                      },
                      onShowPicker: (context, currentValue) async {
                        final date = await showDatePicker(
                            context: context,
                            firstDate:
                                DateTime.now().subtract(Duration(days: 0)),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                        if (date != null) {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(currentValue ??
                                DateTime.now().subtract(Duration(days: 0))),
                          );
                          gethour = date;
                          gethourto = time;
                          return DateTimeField.combine(date, time);
                        } else {
                          return currentValue;
                        }
                      },
                    ),
                  ]),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  child: Column(children: <Widget>[
                    DateTimeField(
                      format: format,
                      controller: dropofftime,
                      decoration: InputDecoration(
                        hintText: 'Tap to select Drop-off date',
                      ),
                      validator: (DateTime dateTime) {
                        if (dateTime == null) {
                          return "Please tap to select Drop-off date";
                        }
                        return null;
                      },
                      onShowPicker: (context, currentValue) async {
                        if (gethour != null && gethourto != null) {
                          final date = await showDatePicker(
                            context: context,
                            initialDate:
                                gethour != null ? gethour : DateTime.now(),
                            firstDate: gethour != null
                                ? gethour.subtract(Duration(days: 0))
                                : DateTime.now().subtract(Duration(days: 0)),
                            lastDate: DateTime(2031),
                          );
                          if (date != null) {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: gethourto != null
                                  ? gethourto
                                  : TimeOfDay.fromDateTime(currentValue ??
                                      DateTime.now()
                                          .subtract(Duration(days: 0))),
                            );
                            return DateTimeField.combine(date, time);
                          } else {
                            return currentValue;
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg:
                                  'Please tap to select pick-up date in first place !');
                        }
                      },
                    ),
                  ]),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20, right: 200),
                child: MaterialButton(
                  color: Color(0xffB15C1E),
                  height: 40,
                  minWidth: 142,
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      mybookdata.add(Booknow(
                        phonenumber.text,
                        numberofpeople.text,
                        halltype.text,
                        datefrom.text,
                        dateto.text,
                        pickuptime.text,
                        dropofftime.text,
                      ));
                      phonenumber.clear();
                      halltype.clear();
                      pickuptime.clear();
                      dropofftime.clear();
                    } else {
                      return null;
                    }
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (BuildContext context) => Notifytransport(
                          notifytransport: mybookdata,
                          thehall: _selectedcars,
                          title: widget.title,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Book Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
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
