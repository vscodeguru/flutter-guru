import 'package:flutter/material.dart';
import 'package:flutter_guru/newCode/states/dashboardState/dashboard.dart';
import 'package:flutter_guru/utils/launcher_helper.dart';
import 'package:flutter_guru/utils/theme/theme_guru.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListViewWidget extends StatefulWidget {
  LeadsModel data;
  ListViewWidget(this.data, {Key key}) : super(key: key);

  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_scaffoldKey,
      appBar: AppBar(
        title: Text('Lead Details'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/300_2.jpg'),
                radius: MediaQuery.of(context).size.width * 0.10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                    child: Text(
                      widget.data.name,
                      style: TextStyle(fontSize: 15, color: Colors.teal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                    child: Text(widget.data.profession),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                    child: Text(widget.data.phoneNumber),
                  ),
                ],
              ),
            ],
          ),
          
Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FloatingActionButton(
                  mini: true,
                  heroTag: null,
                  elevation: 6,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.phone),
                  onPressed: () {
                    luncherHelper().launchDialer(widget.data.phoneNumber).then((data) {
                      if (!data) {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Cannot launch Dialer.'),
                        ));
                      }
                    });
                  }),
              FloatingActionButton(
                  mini: true,
                  heroTag: null,
                  elevation: 6,
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.teal,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 8, right: 4, top: 2, bottom: 10),
                    child: Icon(
                      FontAwesomeIcons.whatsapp,
                      size: 30,
                    ),
                  ),
                  onPressed: () {
                    luncherHelper()
                        .launchWhatsapp(widget.data.phoneNumber)
                        .then((data) {
                      if (!data) {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Cannot launch WhatsApp.'),
                        ));
                      }
                    });
                  }),
              FloatingActionButton(
                mini: true,
                heroTag: null,
                elevation: 6,
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                child: Icon(Icons.message),
                onPressed: () {
                  luncherHelper().launchMessager(widget.data.phoneNumber).then((data) {
                    if (!data) {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content:
                            Text('Cannot launch SMS Messaging Application.'),
                      ));
                    }
                  });
                },
              ),
            ],
          ),
          
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 18.0,
            color: Colors.grey,
          ),
          Expanded(
            child: ListView(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  'Contact',
                  style: TextStyle(fontSize: 35),
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 12.0, 12.0, 6.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'City',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.teal),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 6.0, 12.0, 12.0),
                            child: Text(widget.data.city),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(
                    height: 18.0,
                    color: Colors.grey,
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 12.0, 12.0, 6.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Vechicle Owned',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.teal),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 6.0, 12.0, 12.0),
                            child: Row(
                              children: <Widget>[
                                Text('Car : ' + widget.data.carOwned),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('Bike : ' + widget.data.bikeOwned),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(
                    height: 18.0,
                    color: Colors.grey,
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 12.0, 12.0, 6.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'House Type',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.teal),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 6.0, 12.0, 12.0),
                            child: Text(widget.data.houseType),
                          )
                        ],
                      )
                    ],
                  ),
                  Divider(
                    height: 18.0,
                    color: Colors.grey,
                  ),
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 12.0, 12.0, 6.0),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  'Reason',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.teal),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  12.0, 6.0, 12.0, 12.0),
                              child: Text(widget.data.reason)),
                        ],
                      )
                    ],
                  ),
                  Divider(
                    height: 18.0,
                    color: Colors.grey,
                  ),
                ],
              )
            ]),
          )
        ]),
      ),
    );
  }
}
