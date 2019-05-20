import 'package:flutter/material.dart';
import 'package:flutter_guru/utils/theme/index.dart';
import '../../../../states/auth/registration.dart';
import 'cardElementWidget.dart';

class VehicleWidget extends StatefulWidget {
  @override
  _VehicleWidgetState createState() => _VehicleWidgetState();
}

class _VehicleWidgetState extends State<VehicleWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: HexColor('#466e7a'),
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/Noel.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              //    color: HexColor('#2980b9'),
              //  padding: EdgeInsets.all(20),
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
                                    'Vehicle Details',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Center(
                      child: Text(
                        'What type of Vehicle you have?',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.20,
                        left: MediaQuery.of(context).size.height * 0.045,
                        right: MediaQuery.of(context).size.height * 0.045),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new CardElement(
                          'assets/car.png',
                          'Car',
                          selected:
                              RegistrationState.of(context).data.vehicle.car,
                          onSelect: (selection) {
                            RegistrationState.of(context).data.vehicle.car =
                                selection;

                            RegistrationState.of(context).notify();
                          },
                        ),
                        new CardElement('assets/motorcycle.png', 'Bike',
                            selected: RegistrationState.of(context)
                                .data
                                .vehicle
                                .bike, onSelect: (selection) {
                          RegistrationState.of(context).data.vehicle.bike =
                              selection;
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
              width: double.infinity, // match_parent
              child: FlatButton(
                color: Colors.teal,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: Text('Next',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                textColor: Colors.white,
                onPressed: () {
                  if (RegistrationState.of(context).data.vehicle.bike ||
                      RegistrationState.of(context).data.vehicle.car) {
                    RegistrationState.of(context).currentPage++;
                    RegistrationState.of(context).notify();
                  } else
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text('Please choose Atleast One Vehicle'),
                      action: SnackBarAction(
                        label: 'Ok',
                        onPressed: () {
                          _scaffoldKey.currentState.hideCurrentSnackBar();
                        },
                      ),
                    ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
