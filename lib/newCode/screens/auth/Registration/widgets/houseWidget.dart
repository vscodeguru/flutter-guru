import 'package:flutter/material.dart';
import 'package:flutter_guru/newCode/screens/auth/Registration/widgets/cardElementWidget.dart';
import 'package:flutter_guru/utils/theme/theme_guru.dart';
import '../../../../states/auth/registration.dart';
import 'package:provider/provider.dart';

class HouseWidget extends StatefulWidget {
  @override
  _HouseWidgetState createState() => _HouseWidgetState();
}

class _HouseWidgetState extends State<HouseWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Center(
                      child: Text(
                        'What type of Owner you are?',
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
                          'assets/house.png',
                          'Own house',
                          key:UniqueKey(),
                          selected:
                              RegistrationState.of(context).data.house.own,
                          onSelect: (selection) {
                            setState(() {
                              RegistrationState.of(context)
                                  .data
                                  .house
                                  .select('');
                              if (selection)
                                RegistrationState.of(context)
                                    .data
                                    .house
                                    .select('own');
                              RegistrationState.of(context).notify();
                            });
                          },
                        ),
                        new CardElement(
                          'assets/home.png',
                          'Rented house',
                          key:UniqueKey(),
                          selected:
                              RegistrationState.of(context).data.house.rent,
                          onSelect: (selection) {
                            setState(() {
                              RegistrationState.of(context)
                                  .data
                                  .house
                                  .select('');
                              if (selection)
                                RegistrationState.of(context)
                                    .data
                                    .house
                                    .select('rent');
                              RegistrationState.of(context).notify();
                            });
                          },
                        ),
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
                  } 
                    // _scaffoldKey.currentState.showSnackBar(SnackBar(
                    //   content: Text('Please choose Atleast One Vehicle'),
                    //   action: SnackBarAction(
                    //     label: 'Ok',
                    //     onPressed: () {
                    //       _scaffoldKey.currentState.hideCurrentSnackBar();
                    //     },
                    //   ),
                    // ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
