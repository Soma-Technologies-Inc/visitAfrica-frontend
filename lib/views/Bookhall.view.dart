import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visistafri/models/booknow.model.dart';
import 'package:visistafri/utils/responsiviness.dart';
import 'package:visistafri/views/halldata.view.dart';

class Bookhotel extends StatefulWidget {
  final String title;

  const Bookhotel({Key key, this.title})
      : super(key: key);
  @override
  _BookhotelState createState() => _BookhotelState();
}

class _BookhotelState extends State<Bookhotel> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  List<String> _halls = [
    'Big  Hall (500-1000)',
    'Medium Hall(200-500)',
    'Small Hall(20-100)',
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
  Booknow booknow = Booknow(
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  );
  List<Booknow> booknowlist = [];
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      lastDate: DateTime(2021),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        datefrom.text = picked.toString();
      });
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
                  hint: Text('Please select Hall size'),
                  value: _selectedHalls,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedHalls = newValue;
                    });
                  },
                  items: _halls.map((halls) {
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
                      hintText: 'Select Time',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
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
                      booknowlist.add(Booknow(
                        phonenumber.text,
                        numberofpeople.text,
                        halltype.text,
                        datefrom.text,
                        dateto.text,
                        pickuptime.text,
                        dropofftime.text,
                      ));
                      phonenumber.clear();
                      datefrom.clear();
                      halltype.clear();
                    } else {
                      return null;
                    }

                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (BuildContext context) => Notifyme(
                          notify: booknowlist,
                          thehall: _selectedHalls,
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
