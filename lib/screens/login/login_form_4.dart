import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_guru/screens/login/index.dart';
import 'package:flutter_guru/utils/authentication/index.dart';

class LoginForm4 extends StatefulWidget {
  LoginForm4({
    Key key,
  }) : super(key: key);

  @override
  State<LoginForm4> createState() => _LoginForm4State();
}

class _LoginForm4State extends State<LoginForm4> {
  double ScreenHeight = 0;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenHeight = MediaQuery.of(context).size.height;
    return new Scaffold(
      backgroundColor: Colors.pink,
      body: owais(context),
    );
  }

  Widget owais(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/300_3.jpg'),
            radius: 60.0,
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 25),
          height: MediaQuery.of(context).size.height * 0.30,
          child: Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextField(),
                      RaisedButton(
                        child: Text('Prabakaran'),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                ClipPath(
                  child: Container(
                    color: Colors.pink,
                  ),
                  clipper: GetClipper(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(size.width, 0);
    path.lineTo(0, size.height * 0.4);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
