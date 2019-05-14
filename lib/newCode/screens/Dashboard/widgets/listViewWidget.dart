import 'package:flutter/material.dart';
import 'package:flutter_guru/newCode/states/dashboardState/dashboard.dart';
import 'package:flutter_guru/utils/theme/theme_guru.dart';

class ListViewWidget extends StatelessWidget {
  LeadsModel data;
  ListViewWidget(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                backgroundImage: AssetImage(data.avatar),
                radius: MediaQuery.of(context).size.width * 0.10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 6.0),
                    child: Text(
                      data.name,
                      style: TextStyle(fontSize: 15, color: Colors.teal),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                    child: Text(data.profession),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 6.0, 12.0, 12.0),
                    child: Text(data.phoneNumber),
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
                  onPressed: () {}),
              FloatingActionButton(
                mini: true,
                heroTag: null,
                elevation: 6,
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                child: Icon(Icons.mail),
                onPressed: () {},
              ),
                FloatingActionButton(
                mini: true,
                heroTag: null,
                elevation: 6,
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                child: Icon(Icons.calendar_today),
                onPressed: () {},
              ),
             FloatingActionButton(
                mini: true,
                heroTag: null,
                elevation: 6,
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                child: Icon(Icons.message),
                onPressed: () {},
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
                            child: Text(data.city),
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
                                Text('Car : ' + data.carOwned),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text('Bike : ' + data.bikeOwned),
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
                            child: Text(data.houseType),
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
                              child: Text(data.reason)),
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
