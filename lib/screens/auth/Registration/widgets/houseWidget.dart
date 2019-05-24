import 'package:flutter/material.dart';
import 'package:flutter_guru/screens/auth/Registration/widgets/cardElementWidget.dart';
import 'package:flutter_guru/utils/theme/index.dart';
import 'package:flutter_guru/states/auth/registration.dart';

class HouseWidget extends StatefulWidget {
  @override
  _HouseWidgetState createState() => _HouseWidgetState();
}

class _HouseWidgetState extends State<HouseWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey= GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
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
                        'What kind of house do you live in?',
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
                          key: UniqueKey(),
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
                          key: UniqueKey(),
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
                  if (RegistrationState.of(context).data.house.own ||
                      RegistrationState.of(context).data.house.rent) {
                    RegistrationState.of(context).currentPage++;
                    RegistrationState.of(context).notify();
                  } else
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text('Please make a selection..'),
                      duration: Duration(seconds: 2),
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
