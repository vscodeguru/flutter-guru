import 'package:flutter/material.dart';
import 'package:flutter_guru/screens/auth/Registration/widgets/cardElementWidget.dart';
import 'package:flutter_guru/utils/theme/index.dart';
import 'package:flutter_guru/states/auth/registration.dart';

class PurposeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
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
                                    'Purpose Details',
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
                        top: MediaQuery.of(context).size.height * 0.12,
                        left: MediaQuery.of(context).size.height * 0.045,
                        right: MediaQuery.of(context).size.height * 0.045),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new CardElement(
                              'assets/bank.png',
                              'Investment',
                              key: UniqueKey(),
                              selected: RegistrationState.of(context)
                                  .data
                                  .purpose
                                  .investment,
                              onSelect: (selection) {
                                RegistrationState.of(context)
                                    .data
                                    .purpose
                                    .clear();
                                RegistrationState.of(context)
                                    .data
                                    .purpose
                                    .investment = selection;
                                RegistrationState.of(context).notify();
                              },
                            ),
                            new CardElement(
                              'assets/money.png',
                              'Savings',
                              key: UniqueKey(),
                              selected: RegistrationState.of(context)
                                  .data
                                  .purpose
                                  .savings,
                              onSelect: (selection) {
                                RegistrationState.of(context)
                                    .data
                                    .purpose
                                    .clear();
                                RegistrationState.of(context)
                                    .data
                                    .purpose
                                    .savings = selection;
                                RegistrationState.of(context).notify();
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new CardElement(
                              'assets/cash.png',
                              'Others',
                              key: UniqueKey(),
                              selected: RegistrationState.of(context)
                                  .data
                                  .purpose
                                  .others,
                              onSelect: (selection) {
                                RegistrationState.of(context)
                                    .data
                                    .purpose
                                    .clear();
                                RegistrationState.of(context)
                                    .data
                                    .purpose
                                    .others = selection;
                                RegistrationState.of(context).notify();
                              },
                            ),
                          ],
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
                  if (RegistrationState.of(context).data.purpose.investment ||
                      RegistrationState.of(context).data.purpose.savings ||
                      RegistrationState.of(context).data.purpose.others) {
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
