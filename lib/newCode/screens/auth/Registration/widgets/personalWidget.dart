import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_guru/newCode/screens/auth/Registration/widgets/professiondropdown.dart';
import 'package:flutter_guru/newCode/screens/auth/Registration/widgets/resultWidget.dart';
import '../../../../states/auth/registration.dart';

class PersonalWidget extends StatefulWidget {
  PersonalWidget({
    Key key,
  }) : super(key: key);
  @override
  _PersonalWidgetState createState() => _PersonalWidgetState();
}

class _PersonalWidgetState extends State<PersonalWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  List<String> cities;
  List<String> profession;
  List<String> employ = <String>[
    'Employee',
    'Goverment Employee',
    'Self Employee',
    'Business',
  ];
  String dropdownValue = 'Salem';
  String dropdown = 'Employee';
  bool firstSearch = true;
  var tecNameController = TextEditingController();
  var tecMobileController = TextEditingController();
  var tecCityController = TextEditingController();
  var tecProfessionController = TextEditingController();
  final FocusNode fnNameFocus = FocusNode();
  final FocusNode fnMobileFocus = FocusNode();
  final FocusNode fnCityFocus = FocusNode();
  final FocusNode fnProfessionFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    cities =
        (cities == null) ? RegistrationState.of(context).getCities() : cities;
    profession = (profession == null)
        ? RegistrationState.of(context).getProfession()
        : profession;
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
                    Form(
                      key: formKey,
                      autovalidate: _autoValidate,
                      child: Container(
                        width: double.infinity,
                        height: 460,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 10.0),
                                blurRadius: 5),
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
                                cursorColor: Colors.teal,
                                autovalidate: _autoValidate,
                                validator: validateName,
                                keyboardType: TextInputType.text,
                                buildCounter: (BuildContext context,
                                        {int currentLength,
                                        int maxLength,
                                        bool isFocused}) =>
                                    null,
                                maxLength: 25,
                                controller: tecNameController,
                                focusNode: fnNameFocus,
                                onFieldSubmitted: (term) {
                                  FocusScope.of(context)
                                      .requestFocus(fnMobileFocus);
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
                                cursorColor: Colors.teal,
                                autovalidate: _autoValidate,
                                validator: validateMobile,
                                controller: tecMobileController,
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
                                      .requestFocus(fnCityFocus);
                                },
                                focusNode: fnMobileFocus,
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
                              TextField(
                                cursorColor: Colors.teal,
                                focusNode: fnCityFocus,
                                onSubmitted: (term) {
                                  FocusScope.of(context)
                                      .requestFocus(fnProfessionFocus);
                                },
                                controller: tecCityController,
                                onTap: () {
                                  Navigator.push<String>(context,
                                      MaterialPageRoute(
                                    builder: (ctx) {
                                      return User(
                                        cities: cities,
                                      );
                                    },
                                  )).then((data) {
                                    setState(() {
                                      tecCityController.text = data;
                                    });
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter your city',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                ),
                              ),
                              SizedBox(height: 25),
                              Text(
                                'Profession',
                              ),
                              TextField(
                                cursorColor: Colors.teal,
                                keyboardType: null,
                                //  focusNode: fnCityFocus,
                                onSubmitted: (term) {
                                  FocusScope.of(context)
                                      .requestFocus(fnProfessionFocus);
                                },
                                controller: tecProfessionController,
                                onTap: () {
                                  Navigator.push<String>(context,
                                      MaterialPageRoute(
                                    builder: (ctx) {
                                      return Profession(
                                        profession: profession,
                                      );
                                    },
                                  )).then((data) {
                                    setState(() {
                                      tecProfessionController.text = data;
                                    });
                                  });
                                },
                                decoration: InputDecoration(
                                  hintText: 'Enter your profession',
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12.0),
                                ),
                              ),
                            ],
                          ),
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
                top: MediaQuery.of(context).size.height * 0.78,
                left: MediaQuery.of(context).size.width * 0.43),
            child: FloatingActionButton(
              elevation: 6,
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
              child: Icon(Icons.arrow_forward),
              onPressed: () {
                validateInputs();
              },
            ),
          )
        ],
      ),
    );
  }

  String validateName(String value) {
    if (value.isEmpty)
      return 'Name is required';
    else
      return null;
  }

  String validateMobile(String value) {
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    }
    return null;
  }

  void validateInputs() {
    final form = formKey.currentState;
    if (formKey.currentState.validate()) {
      RegistrationState.of(context).data.personal.name = tecNameController.text;
      RegistrationState.of(context).data.personal.mobile =
          tecMobileController.text;
      RegistrationState.of(context).data.personal.city = dropdownValue;
      RegistrationState.of(context).data.personal.profession = dropdown;
      RegistrationState.of(context).currentPage++;
      RegistrationState.of(context).notify();
      form.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
