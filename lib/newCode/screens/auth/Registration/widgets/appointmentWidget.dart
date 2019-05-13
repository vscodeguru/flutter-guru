import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../states/auth/registration.dart';

import 'package:flutter_guru/utils/theme/index.dart';

class AppointmentWidget extends StatefulWidget {
  @override
  _AppointmentWidgetState createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {

  DateTime _date = new DateTime.now();
  TimeOfDay _time = new  TimeOfDay.now();
  selectedDate(BuildContext context) async{
    final DateTime picked = await showDatePicker(
      context:context,
      initialDate: _date,
      firstDate: DateTime(1990),
      lastDate: DateTime(2035)
    );
  }
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
  String dropdownValue = 'Salem';
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
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/Noel.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 28.0, right: 28.0, top: 120.0),
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
                            padding: EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 16.0),
                            child: Form(
                              key: _formKey,
                              //autovalidate: _autoValidate,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'User Details',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Name',
                                  ),
                                  
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  left: MediaQuery.of(context).size.width * 0.42,
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
                          professionController.text;
                      RegistrationState.of(context).currentPage++;
                      RegistrationState.of(context).notify();
                    },
                  ),
                ),
              ],
            ),
            // Center(
            //   child: Image(
            //     image: AssetImage('assets/Color-GreyedOut.png'),
            //     width: MediaQuery.of(context).size.width * 1.05,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
