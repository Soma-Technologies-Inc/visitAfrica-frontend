import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:visistafri/models/booknow.model.dart';
import 'package:visistafri/utils/responsiviness.dart';
import 'package:visistafri/views/hoteldata.view.dart';

class EditHotelRequest extends StatefulWidget {
  final String title;
  String myphonenumber;
  String mynumberofpeople;
  String myroomtype;
  String mydatefrom;
  String mydateto;
  String mypickuptime;
  String mydropofftime;

  EditHotelRequest({
    Key key,
    this.title,
    this.myphonenumber,
    this.mynumberofpeople,
    this.myroomtype,
    this.mydatefrom,
    this.mydateto,
    this.mypickuptime,
    this.mydropofftime,
  }) : super(key: key);
  @override
  _EditHotelRequestState createState() => _EditHotelRequestState();
}

class _EditHotelRequestState extends State<EditHotelRequest> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<String> _rooms = [
    'Single Room',
    'Double Room',
    'Triple Room',
    'Queen Room',
    'Quad Room',
    'King Room',
    'Twin Room',
    'Studio Room',
  ];
  String _selectedHalls;
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
  var gethour;
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      lastDate: DateTime(2031),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        gethour = picked;
        datefrom.text = picked.toString();
      });
  }

  _selectDateTo(BuildContext context) async {
    if (gethour != null) {
      final DateTime picked = await showDatePicker(
        context: context,
        initialDate: gethour != null ? gethour : DateTime.now(),
        firstDate: gethour != null
            ? gethour.subtract(Duration(days: 0))
            : DateTime.now().subtract(Duration(days: 0)),
        lastDate: DateTime(2031),
      );
      if (picked != null && picked != selectedDate)
        setState(() {
          dateto.text = picked.toString();
        });
    } else {
      Fluttertoast.showToast(msg: 'Please select date from in first place');
    }
  }

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
                "assets/images/Group 3.png",
                width: 1000,
                height: ScreenSize.defaultSize * 26,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 220.0, left: 10.0),
                child: Text(
                  'Update your booking',
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
                padding: const EdgeInsets.only(top: 270.0, left: 10.0),
                child: Text(
                  'Fill the form below to edit your request',
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
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 30),
                child: TextFormField(
                  controller: phonenumber,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: '${widget.myphonenumber}',
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
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: numberofpeople,
                  decoration:
                      InputDecoration(hintText: '${widget.mynumberofpeople}'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter your name";
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
                  hint: Text('Please select Room type'),
                  value: _selectedHalls,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedHalls = newValue;
                    });
                  },
                  items: _rooms.map((halls) {
                    return DropdownMenuItem(
                      child: new Text(halls),
                      value: halls,
                    );
                  }).toList(),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                child: TextFormField(
                    controller: datefrom,
                    decoration: InputDecoration(
                      hintText: '${widget.mydatefrom}',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        color: Color(0xffB15C1E),
                        onPressed: () => _selectDate(context),
                      ),
                    ),
                    readOnly: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please select time";
                      } else
                        return null;
                    }),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
                child: TextFormField(
                    controller: dateto,
                    decoration: InputDecoration(
                      hintText: '${widget.mydateto}',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectDateTo(context),
                      ),
                    ),
                    readOnly: true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Please select time";
                      } else
                        return null;
                    }),
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
                      numberofpeople.clear();
                      halltype.clear();
                      datefrom.clear();
                      dateto.clear();
                    } else {
                      return null;
                    }
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (BuildContext context) => Notifyhotel(
                          notifyhotel: mybookdata,
                          thehall: _selectedHalls,
                          title: widget.title,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Update',
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
