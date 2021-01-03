import 'dart:io';
import 'package:flutter/material.dart';
import 'package:visistafri/models/UserData.model.dart';
import 'package:visistafri/widgets/button.widget.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key key}) : super(key: key);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  UserInfo newUserInfo = new UserInfo();
  TextEditingController birthdate = new TextEditingController();
  File newProfilePic;
  DateTime selectedDate = DateTime.now();

  List<String> _languages = [
    'English',
    'Spanish',
    'French',
    'Hindi',
    'Polish',
    'Korean',
  ];

  List<String> _currency = [
    ' United States Dollar',
    'Yen',
    'Pound',
    'Euro',
    'Rupee',
    'Won',
    'Singapore Dollar',
  ];

  List<String> _gender = [
    'Male',
    'Female',
    'Other',
  ];

  Widget buildLanguageDropdown() {
    return DropdownButtonFormField(
      isExpanded: true,
      hint: Text('Enter Language'),
      onChanged: (language) {
        setState(() {
          newUserInfo.language = language;
        });
      },
      items: _languages.map((lang) {
        return DropdownMenuItem(
          child: new Text(lang),
          value: lang,
        );
      }).toList(),
      validator: (value) => value.isEmpty ? 'Language is required' : null,
    );
  }

  Widget buildCurrencyDropdown() {
    return DropdownButtonFormField(
      isExpanded: true,
      hint: Text('Enter Currency'),
      onChanged: (currency) {
        setState(() {
          newUserInfo.currency = currency;
        });
      },
      items: _currency.map((curr) {
        return DropdownMenuItem(
          child: new Text(curr),
          value: curr,
        );
      }).toList(),
      validator: (value) => value.isEmpty ? 'Currency is required' : null,
    );
  }

  Widget buildGenderDropdown() {
    return DropdownButtonFormField(
      isExpanded: true,
      hint: Text('Enter Gender'),
      onChanged: (gender) {
        setState(() {
          newUserInfo.gender = gender;
        });
      },
      items: _gender.map((gen) {
        return DropdownMenuItem(
          child: new Text(gen),
          value: gen,
        );
      }).toList(),
      validator: (value) => value.isEmpty ? 'gender is required' : null,
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1930),
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        birthdate.text = picked.toString();
      });
  }

  _imgFromCamera() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      newUserInfo.newProfilePic = image;
    });
  }

  _imgFromGallery() async {
    // ignore: deprecated_member_use
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      newUserInfo.newProfilePic = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      "assets/images/Group 3.png",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 180.0, left: 30.0),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: buildForm(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildProfilePicture(),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      'Name',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter Your Name",
                    ),
                    validator: (val) => val.isEmpty ? 'Name is required' : null,
                    onSaved: (val) => newUserInfo.name = val,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      'Email',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter Your Email",
                    ),
                    validator: (value) =>
                        (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value))
                            ? null
                            : 'Please enter a valid email address',
                    onSaved: (val) => newUserInfo.email = val,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: new Text(
                      'Gender',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Container(
                    child: new Text(
                      'Birthday',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  flex: 2,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: buildGenderDropdown(),
                  ),
                  flex: 2,
                ),
                Flexible(
                  child: TextFormField(
                    controller: birthdate,
                    decoration: InputDecoration(
                      hintText: 'Enter  Birthdate',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        color: Color(0xffB15C1E),
                        onPressed: () => _selectDate(context),
                      ),
                    ),
                    readOnly: true,
                    validator: (value) =>
                        value.isEmpty ? 'Date is required' : null,
                    onSaved: (value) => newUserInfo.birthdate = value,
                  ),
                  flex: 2,
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: new Text(
                        'Language',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Container(
                      child: new Text(
                        'Currency',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    flex: 2,
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: buildLanguageDropdown()),
                  flex: 2,
                ),
                Flexible(
                  child: buildCurrencyDropdown(),
                  flex: 2,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text(
                      'Location',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Flexible(
                  child: TextFormField(
                    // controller: location,
                    decoration: const InputDecoration(
                      hintText: "Enter Your Address",
                    ),
                    validator: (val) =>
                        val.isEmpty ? 'address is required' : null,
                    onSaved: (value) => newUserInfo.location = value,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 25.0, right: 25.0, top: 25.0, bottom: 25.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Button(
                      onPressed: () {
                        _formKey.currentState.reset();
                      },
                      child: Text(
                        'Reset',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Button(
                      onPressed: _submitForm,
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  flex: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfilePicture() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              _showPicker(context);
            },
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xffB15C1E),
              child: newUserInfo.newProfilePic != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.file(
                        newUserInfo.newProfilePic,
                        width: 100,
                        height: 100,
                        fit: BoxFit.fitHeight,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(50)),
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.camera_alt,
                        color: Color(0xff310A0A),
                      ),
                    ),
            ),
          ),
        )
      ],
    );
  }

  void _submitForm() {
    final FormState form = _formKey.currentState;

    if (!form.validate()) {
      showMessage('Form is not valid!  Please review and correct.');
    } else {
      form.save(); //This invokes each onSaved event
      print('pic: ${newUserInfo.newProfilePic}');
      print('name: ${newUserInfo.name}');
      print('email: ${newUserInfo.email}');
      print('gender ${newUserInfo.gender}');
      print('birthdate: ${newUserInfo.birthdate}');
      print('lang: ${newUserInfo.language}');
      print('currency: ${newUserInfo.currency}');
      print('location: ${newUserInfo.location}');
     
    }
  }

  String showMessage(String s) {
    return s;
  }
}
