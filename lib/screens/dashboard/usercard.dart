import 'package:flutter/material.dart';

class Usercard extends StatefulWidget {
  Usercard({Key key}) : super(key: key);

  _UsercardState createState() => _UsercardState();
}

class _UsercardState extends State<Usercard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
        centerTitle: true,
        title: Text('Dashboard'),
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              height: 120,
              child: Card(
                elevation: 10,
                color: Color.fromRGBO(64, 75, 96, .9),
                margin: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.refresh,
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
                          'Introduction To driving',
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
                      children: <Widget>[Icon(Icons.arrow_forward)],
                    )
                  ],
                ),
              ),
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
