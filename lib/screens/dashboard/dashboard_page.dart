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
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomPadding: false,
        drawer: _buildDrawer(),
        appBar: _buildAppBar(),
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
      ),
    );
  }

  Drawer _buildDrawer() {
    return Drawer(
      elevation: 12,
      child: Container(
        color: Colors.transparent,
        child: new ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  image: new DecorationImage(
                      image: AssetImage('assets/salesforce.jpg')),
                  color: HexColor('#8769FE')),
              accountName: new Text(
                'Flutter Guru',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              accountEmail: new Text('vscodeguru@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/100_14.jpg'),
                  // child: Text(
                  //   'F',
                  //   style: TextStyle(
                  //     color: HexColor('#8769FE'),
                  //     fontSize: 40.0,
                  //   ),
                  // ),
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 25),
              title: new Text(
                'Label',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(
                Icons.person,
                color: HexColor('8769FE'),
              ),
              title: new Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('User can view the profile'),
            ),
            Divider(height: 1.0, indent: 70.0),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: new Text(
                'Shopping',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Shopping details'),
              leading: new Icon(
                Icons.shopping_cart,
                color: HexColor('8769FE'),
              ),
            ),
            Divider(height: 5.0, indent: 70.0),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: new Text(
                'Dashboard',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Dashboard view'),
              leading: new Icon(
                Icons.dashboard,
                color: HexColor('8769FE'),
              ),
            ),
            Divider(height: 5.0, indent: 70.0),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: new Text(
                'Timeline',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Timeline sheet'),
              leading: new Icon(
                Icons.timeline,
                color: HexColor('8769FE'),
              ),
            ),
            Divider(height: 5.0, indent: 70.0),
            ListTile(
              title: new Text(
                'Activites',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("/card");
              },
              leading: new Icon(
                Icons.credit_card,
                color: HexColor('8769FE'),
              ),
              title: new Text(
                'Card',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('You can see the card details'),
            ),
            Divider(height: 5.0, indent: 70.0),
            ListTile(
              onTap: () {
                Navigator.of(context).pushNamed("/report");
              },
              leading: new Icon(
                Icons.report,
                color: HexColor('8769FE'),
              ),
              title: new Text(
                'Report',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('You can see the card details'),
            ),
            Divider(height: 5.0, indent: 70.0),
            ListTile(
              onTap: () {
               Navigator.of(context).pushNamed("/expand");
              },
              leading: new Icon(
                Icons.home,
                color: HexColor('8769FE'),
              ),
              title: new Text(
                'Home',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('You can see the card details'),
            ),
            Divider(height: 5.0, indent: 70.0),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: new Icon(
                Icons.account_balance,
                color: HexColor('8769FE'),
              ),
              title: new Text(
                'Accounts',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('You can see the account details'),
            ),
            Divider(height: 5.0, indent: 70.0),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: new Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: new Icon(
                Icons.settings_backup_restore,
                color: HexColor('8769FE'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: HexColor('#8769FE').withOpacity(0.9),
      centerTitle: true,
      title: Text('Dashboard'),
      elevation: 0.0,
    );
  }

  Stack _buildDownStack() {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          top: MediaQuery.of(context).size.height * 0.49,
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
                  onTap: () {
                    Navigator.of(context).pushNamed("/card");
                  },
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
                  onTap: () {
                    Navigator.of(context).pushNamed("/report");
                  },
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
      top: MediaQuery.of(context).size.height * 0.38,
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
      height: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 10, left: 30),
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
                padding: EdgeInsets.only(top: 10, left: 20),
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
            padding: EdgeInsets.only(
              left: 40,
            ),
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
            padding: EdgeInsets.only(left: 40, bottom: 70),
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
