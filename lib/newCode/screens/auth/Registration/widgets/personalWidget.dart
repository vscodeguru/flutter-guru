import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../states/auth/registration.dart';

import 'package:flutter_guru/utils/theme/index.dart';

class PersonalWidget extends StatefulWidget {
  @override
  _PersonalWidgetState createState() => _PersonalWidgetState();
}

class _PersonalWidgetState extends State<PersonalWidget> {
  final List<String> _dropdownValues = [
    "Salem",
    "Chennai",
    "Coimbatore",
    "Chennai",
    "Bangalore"
  ];
  String city = '';
  var nameController = TextEditingController();
  var mobileController = TextEditingController();
  var cityController = TextEditingController();
  var professionController = TextEditingController();
  final FocusNode nameFocus = FocusNode();
  final FocusNode mobileFocus = FocusNode();
  final FocusNode cityFocus = FocusNode();
  final FocusNode professionFocus = FocusNode();

  Widget build(BuildContext context) {
    nameController.text = RegistrationState.of(context).data.personal.name;
    mobileController.text = RegistrationState.of(context).data.personal.mobile;
    cityController.text = RegistrationState.of(context).data.personal.city;
    professionController.text =
        RegistrationState.of(context).data.personal.profession;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: themeGuru.getColor('#466e7a'),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // width: double.infinity,
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
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 16.0),
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
                                  FocusScope.of(context)
                                      .requestFocus(cityFocus);
                                },
                                focusNode: mobileFocus,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  hintText: 'Enter your Mobile Number',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'City',
                              ),
                              DropdownButton(
                                items: _dropdownValues
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String value) {},
                                isExpanded: false,
                                hint: Text('DropdownButton Hint'),
                              ),
                              // TextFormField(
                              //   focusNode: cityFocus,
                              //   onFieldSubmitted: (term) {
                              //     FocusScope.of(context)
                              //         .requestFocus(professionFocus);
                              //   },
                              //   textInputAction: TextInputAction.next,
                              //   decoration: InputDecoration(
                              //     hintText: 'Enter your city',
                              //     hintStyle:
                              //         TextStyle(color: Colors.grey, fontSize: 12.0),
                              //   ),
                              // ),
                              SizedBox(height: 20),
                              Text(
                                'Profession',
                              ),
                              TextFormField(
                                onFieldSubmitted: (value) {
                                  cityFocus.unfocus();
                                  Navigator.of(context).pushNamed("/sample");
                                },
                                textInputAction: TextInputAction.done,
                                focusNode: professionFocus,
                                decoration: InputDecoration(
                                  hintText: 'Enter your Profession',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.63,
                left: MediaQuery.of(context).size.width * 0.42,
                child: FloatingActionButton(
                  elevation: 6,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.arrow_forward),
                  onPressed: () {
                    //return;

                    RegistrationState.of(context).data.personal.name =
                        nameController.text;

                    RegistrationState.of(context).currentPage++;
                    RegistrationState.of(context).notify();
                  },
                ),
              ),
            ],
          ),
          Center(
            child: Image(
              image: AssetImage('assets/Color-GreyedOut.png'),
              width: MediaQuery.of(context).size.width * 1.05,
            ),
          ),
        ],
      ),
    );
  }
}
