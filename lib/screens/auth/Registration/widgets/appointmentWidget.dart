import 'package:flutter/material.dart';
import 'package:flutter_guru/states/dashboardState/dashboard.dart';
import 'package:flutter_guru/states/auth/registration.dart';

import 'package:flutter_guru/utils/theme/index.dart';

class AppointmentWidget extends StatefulWidget {
  @override
  _AppointmentWidgetState createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  DateTime _date = new DateTime.now();
  TimeOfDay _time = new TimeOfDay.now();

  selectedDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1990),
        lastDate: DateTime(2035));

    if (picked != null && picked != _date) {
      
      setState(() {
        _date = picked;
        dateController.text =
            "${_date.day.toString()}-${_date.month.toString().padLeft(2, '0')}-${_date.year.toString().padLeft(2, '0')}";
      });
    }
  }

  selectedTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: _time);
    if (picked != null && picked != _time) {
      
      setState(() {
        _time = picked;
        timeController.text = _time.format(context);
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    dateController.text =
        "${_date.day.toString()}-${_date.month.toString().padLeft(2, '0')}-${_date.year.toString().padLeft(2, '0')}";
    timeController.text = _time.format(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/Noel.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 80,
              decoration: new BoxDecoration(
                color: HexColor('#1a6d75').withOpacity(0.8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 7.0),
                      blurRadius: 3),
                ],
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 28,
                    ),
                    Row(
                      //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          padding: EdgeInsets.all(0.0),
                          onPressed: () {
                            RegistrationState.of(context).currentPage--;
                            RegistrationState.of(context).notify();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Appointment Details',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 28.0,
                        right: 28.0,
                        top: MediaQuery.of(context).size.height * 0.20),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 300,
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
                                  'Appointment Date & Time',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Appointment Date ',
                                ),
                                GestureDetector(
                                  onTap: () {
                                    selectedDate(context);
                                  },
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      controller: dateController,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.calendar_today),
                                        hintText: ' Date',
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 12.0),
                                      ),
                                      keyboardType: null,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Appointment Time',
                                ),
                                GestureDetector(
                                  onTap: () {
                                    selectedTime(context);
                                  },
                                  child: AbsorbPointer(
                                    child: TextFormField(
                                      controller: timeController,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.timer),
                                        hintText: ' Time',
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 12.0),
                                      ),
                                      keyboardType: null,
                                    ),
                                  ),
                                )
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
                  bottom: 1,
                  left: MediaQuery.of(context).size.width * 0.42,
                  child: FloatingActionButton(
                    elevation: 6,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.teal,
                    child: Icon(Icons.arrow_forward),
                    onPressed: () {
                      _showDialog();
                      // RegistrationState.of(context).currentPage++;
                      // RegistrationState.of(context).notify();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext _ctx) {
        // return object of type Dialog
        return AlertDialog(
          content: new Text("Do you want to save your details ?"),
          actions: <Widget>[
            FlatButton(
                child: Text('Cancel'),
                color: Colors.teal,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("yes"),
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pop();
                LeadsModel data = LeadsModel();
                data.name = RegistrationState.of(context).data.personal.name;
                data.phoneNumber = RegistrationState.of(context).data.personal.mobile;
                data.city = RegistrationState.of(context).data.personal.city;
                data.profession = RegistrationState.of(context).data.personal.profession;

                data.bikeOwned = RegistrationState.of(context).data.vehicle.bike ? 'Yes' : 'No';
                data.carOwned = RegistrationState.of(context).data.vehicle.car ? 'Yes' : 'No';

                data.houseType = RegistrationState.of(context).data.house.own ? 'Own House' : 'Rented House';

                if(RegistrationState.of(context).data.purpose.investment) data.reason = 'Investment';
                if(RegistrationState.of(context).data.purpose.salary) data.reason = 'Salaryy';
                if(RegistrationState.of(context).data.purpose.others) data.reason = 'Other';

                data.date = dateController.text;
                data.time = timeController.text;
                Navigator.of(context).pop<LeadsModel>(data);
              },
            ),
          ],
        );
      },
    );
  }
}
