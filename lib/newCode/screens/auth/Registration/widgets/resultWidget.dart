import 'package:flutter/material.dart';
import 'package:flutter_guru/newCode/states/auth/registration.dart';
import 'package:flutter_guru/utils/theme/theme_guru.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("assets/Noel.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              //    color: HexColor('#2980b9'),
              // padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                                    'Home Details',
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
                  Container(
                    padding: EdgeInsets.only(
                      left: 40,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          height: 90,
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Name : ' +
                                    RegistrationState.of(context)
                                        .data
                                        .personal
                                        .name,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text(
                                  'Mobile : ' +
                                      RegistrationState.of(context)
                                          .data
                                          .personal
                                          .mobile,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 40, bottom: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text(
                                  'city : ' +
                                      RegistrationState.of(context)
                                          .data
                                          .personal
                                          .city,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text(
                                  'Profession : ' +
                                      RegistrationState.of(context)
                                          .data
                                          .personal
                                          .profession,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 40, bottom: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text(
                                  'Car : ' +
                                      ((RegistrationState.of(context)
                                              .data
                                              .vehicle
                                              .car)
                                          ? 'yes'
                                          : 'No'),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text(
                                  'Bike : ' +
                                      ((RegistrationState.of(context)
                                              .data
                                              .vehicle
                                              .car)
                                          ? 'yes'
                                          : 'No'),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 40, bottom: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text(
                                  'Own : ' +
                                      ((RegistrationState.of(context)
                                              .data
                                              .house
                                              .own)
                                          ? 'yes'
                                          : 'No'),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text(
                                  'Rent : ' +
                                      ((RegistrationState.of(context)
                                              .data
                                              .house
                                              .rent)
                                          ? 'yes'
                                          : 'No'),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 40, bottom: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text(
                                  'Investment : ' +
                                      ((RegistrationState.of(context)
                                              .data
                                              .purpose
                                              .investment)
                                          ? 'yes'
                                          : 'No'),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Text(
                                  'Salary : ' +
                                      ((RegistrationState.of(context)
                                              .data
                                              .purpose
                                              .salary)
                                          ? 'yes'
                                          : 'No'),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
