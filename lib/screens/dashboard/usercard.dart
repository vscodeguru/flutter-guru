import 'package:flutter/material.dart';

class Usercard extends StatefulWidget {
  Usercard({Key key}) : super(key: key);

  _UsercardState createState() => _UsercardState();
}

class _UsercardState extends State<Usercard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new BottomAppBar(
        notchMargin: 4.0,
        shape: CircularNotchedRectangle(),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.dashboard,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.data_usage,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.device_hub,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.dns,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        heroTag: null,
        elevation: 5,
        foregroundColor: Colors.yellowAccent,
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        centerTitle: true,
        title: Text('Driving'),
        elevation: 0.1,
      ),
      body: Container(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: ListView(
          children: <Widget>[
            _buildFirstContainer(), 
            _buildSecondContainer(),
            _buildThirdContainer(),
            _buildFourthContainer(),
            _buildFifthContainer(),
            _buildSixthContainer(),
            _buildSeventhContainer(),
          ],
        ),
      ),
    );
  }

  Container _buildSeventhContainer() {
    return Container(
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 8.0,
        color: Color.fromRGBO(64, 75, 96, .9),
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.airport_shuttle,
                  color: Colors.white,
                ),
                VerticalDivider(
                  width: 2,
                  indent: 15.0,
                  color: Colors.white,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Reverse Parallel Parking',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.linear_scale,
                      color: Colors.yellow,
                    ),
                    Text(
                      'Intermediate',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildSixthContainer() {
    return Container(
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 8.0,
        color: Color.fromRGBO(64, 75, 96, .9),
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.airport_shuttle,
                  color: Colors.white,
                ),
                VerticalDivider(
                  width: 2,
                  indent: 15.0,
                  color: Colors.white,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Reverse Parallel Parking',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.linear_scale,
                      color: Colors.yellow,
                    ),
                    Text(
                      'Intermediate',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildFifthContainer() {
    return Container(
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 8.0,
        color: Color.fromRGBO(64, 75, 96, .9),
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.tram,
                  color: Colors.white,
                ),
                VerticalDivider(
                  width: 2,
                  indent: 15.0,
                  color: Colors.white,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Incorrect Use of Signals',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.linear_scale,
                      color: Colors.yellow,
                    ),
                    Text(
                      'Intermediate',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildFourthContainer() {
    return Container(
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 8.0,
        color: Color.fromRGBO(64, 75, 96, .9),
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.motorcycle,
                  color: Colors.white,
                ),
                VerticalDivider(
                  width: 2,
                  indent: 15.0,
                  color: Colors.white,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Reversing Around Corner',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.linear_scale,
                      color: Colors.yellow,
                    ),
                    Text(
                      'Intermediate',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildThirdContainer() {
    return Container(
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 8.0,
        color: Color.fromRGBO(64, 75, 96, .9),
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.departure_board,
                  color: Colors.white,
                ),
                VerticalDivider(
                  width: 2,
                  indent: 15.0,
                  color: Colors.white,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Reverse Parallel Parking',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.linear_scale,
                      color: Colors.yellow,
                    ),
                    Text(
                      'Intermediate',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildSecondContainer() {
    return Container(
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 8.0,
        color: Color.fromRGBO(64, 75, 96, .9),
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.airport_shuttle,
                  color: Colors.white,
                ),
                VerticalDivider(
                  width: 2,
                  indent: 15.0,
                  color: Colors.white,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Observation at Junctions',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.linear_scale,
                      color: Colors.yellow,
                    ),
                    Text(
                      'Beginner',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container _buildFirstContainer() {
    return Container(
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 8.0,
        color: Color.fromRGBO(64, 75, 96, .9),
        margin: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(
                  Icons.drive_eta,
                  color: Colors.white,
                ),
                VerticalDivider(
                  width: 2,
                  indent: 15.0,
                  color: Colors.white,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Introduction To Driving',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.linear_scale,
                      color: Colors.yellow,
                    ),
                    Text(
                      'Intermediate',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height);
    var firstEndPoint = Offset(size.width * 5, size.height - 35.0);
    var firstControlPoint = Offset(size.width * 0.25, size.height - 50.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 80.0);
    var secondControlPoint = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
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
