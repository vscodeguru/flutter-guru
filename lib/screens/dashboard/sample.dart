import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  Sample({Key key}) : super(key: key);

  _SampleState createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
        centerTitle: true,
        title: Text('Driving'),
        elevation: 0.1,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('What Type of Owner you are?'),
              ],
            ),
            Row(
              children: <Widget>[
                 CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/300_3.jpg'),
                      radius: MediaQuery.of(context).size.width * 0.10,
                    ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
