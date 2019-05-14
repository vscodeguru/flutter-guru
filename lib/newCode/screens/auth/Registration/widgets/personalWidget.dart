import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../states/auth/registration.dart';

import 'package:flutter_guru/utils/theme/index.dart';

class PersonalWidget extends StatefulWidget {
  @override
  _PersonalWidgetState createState() => _PersonalWidgetState();
}

class _PersonalWidgetState extends State<PersonalWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  List<String> cities = <String>[
    'Salem',
    'Chennai',
    'bangalore',
    'Coimbatore',
    'Tirupur',
    'Trichy'
  ];
  List<String> employ = <String>[
    'Employee',
    'Goverment Employee',
    'Self Employee',
    'Business',
    'Salaried',
  ];
  String dropdownValue = 'Salem';
  String dropdown = 'Employee';
  String name;
  String mobile;
  String city;
  String profession;
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var professionController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final FocusNode mobileFocus = FocusNode();
  final FocusNode cityFocus = FocusNode();
  final FocusNode professionFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/Noel.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 120.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 430,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0.0, 10.0),
                              blurRadius: 5),
                          //     BoxShadow(
                          //  color: Colors.black12,
                          //      offset: Offset(0.0, -10.0),
                          //      blurRadius: 0),
                        ],
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'User Details',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Name',
                            ),
                            TextFormField(
                              buildCounter: (BuildContext context,
                                      {int currentLength,
                                      int maxLength,
                                      bool isFocused}) =>
                                  null,
                              maxLength: 25,
                              controller: nameController,
                              focusNode: nameFocus,
                              onFieldSubmitted: (term) {
                                FocusScope.of(context)
                                    .requestFocus(mobileFocus);
                              },
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: 'Enter your Name',
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 12.0),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Mobile',
                            ),
                            TextFormField(
                              controller: mobileController,
                              //  autovalidate: _autoValidate,
                              buildCounter: (BuildContext context,
                                      {int currentLength,
                                      int maxLength,
                                      bool isFocused}) =>
                                  null,
                              maxLength: 10,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                              keyboardType: TextInputType.phone,
                              onFieldSubmitted: (term) {
                                FocusScope.of(context).requestFocus(cityFocus);
                              },
                              focusNode: mobileFocus,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                hintText: 'Enter your Mobile Number',
                                hintStyle: TextStyle(
                                    color: Colors.grey, fontSize: 12.0),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'City',
                            ),
                            DropdownButtonFormField<String>(
                              value: dropdownValue,
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: cities
                                  .map<DropdownMenuItem<String>>(
                                      (String value) =>
                                          DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          ))
                                  .toList(),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Profession',
                            ),
                            DropdownButtonFormField<String>(
                              value: dropdown,
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdown = newValue;
                                });
                              },
                              items: employ
                                  .map<DropdownMenuItem<String>>(
                                      (String value) =>
                                          DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          ))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.72,
                left: MediaQuery.of(context).size.width * 0.43),
            child: FloatingActionButton(
              elevation: 6,
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
              child: Icon(Icons.arrow_forward),
              onPressed: () {
                RegistrationState.of(context).data.personal.name =
                    nameController.text;
                RegistrationState.of(context).data.personal.mobile =
                    mobileController.text;
                RegistrationState.of(context).data.personal.city =
                    dropdownValue;
                RegistrationState.of(context).data.personal.profession =
                    dropdown;
                RegistrationState.of(context).currentPage++;
                RegistrationState.of(context).notify();
              },
            ),
          )
        ],
      ),
    );
  }
}
