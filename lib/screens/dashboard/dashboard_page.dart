import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guru/utils/authentication/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Fluttertoast.showToast(
      timeInSecForIos: 1,
      msg: 'Welcome !!',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: HexColor('#314453'),
      textColor: Colors.white,
    );
  }
  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      //  appBar: AppBar(
      //    centerTitle: true,
      //    title: Text('Dashboard'),
      //  ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              HexColor('#f8f8f9'),
              HexColor('#f5f4f8'),
              HexColor('#ece8f4'),
              HexColor('#f8f8f9'),
              //         HexColor('f1eff6'),
              //            HexColor('f5f5f6')
            ],
          ),
        ),
        //  color: HexColor('#f1eef6'),
        child: Stack(
          children: <Widget>[
            _buildTopContainer(context),
            _buildMiddlePositioned(),
            _buildDownStack(),
          ],
        ),
      ),
    );
  }
  Stack _buildDownStack() {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          top: MediaQuery.of(context).size.height * 0.58,
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.only(left: 0.0),
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
              children: <Widget>[
                GestureDetector(
                     onTap: () {},
                  child: Card(
                    color: HexColor('#ffffff'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.card_membership,
                              color: Colors.redAccent,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Card",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Card(
                    color: HexColor('#ffffff'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.receipt,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Report",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Card(
                    color: HexColor('#ffffff'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              color: Colors.greenAccent,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Home",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Card(
                    color: HexColor('#ffffff'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.attach_money,
                              color: Colors.purpleAccent,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Loan",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Card(
                    color: HexColor('#ffffff'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              color: Colors.indigo,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Person ",
                              //   style: TextStyle(fontFamily: UIData.ralewayFont),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  child: Card(
                    color: HexColor('#ffffff'),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Icon(
                              Icons.business,
                              color: Colors.yellow,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Business",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  Positioned _buildMiddlePositioned() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.45,
      width: MediaQuery.of(context).size.width * 1.10,
      height: MediaQuery.of(context).size.height * 0.12,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left: 10, right: 50),
        height: 50,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Prescribe',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Investigation',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Diet Plan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Container _buildTopContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            HexColor('#657DFA'),
            HexColor('#8769FE'),
            HexColor('#A361F2'),
          ],
        ),
      ),
      height: 330.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 100, left: 30),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/300_3.jpg'),
                      radius: MediaQuery.of(context).size.width * 0.10,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 100, left: 20),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Flutter Guru',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 40),
            child: Row(
              //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Gender:',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Male',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Age:',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '27 Years',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 40, bottom: 40),
            child: Row(
              //    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Mobile:',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '9994594163',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Text(
                        'Type:',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'LIC policy',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
