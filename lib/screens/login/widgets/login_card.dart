import 'dart:async';

import 'package:flutter/material.dart';

class LoginCard extends StatefulWidget {
  @override
  _LoginCardState createState() => new _LoginCardState();
}

class _LoginCardState extends State<LoginCard>
    with SingleTickerProviderStateMixin {
  var deviceSize;
  AnimationController controller;
  Animation<double> animation;
  String phoneNumber, otp;

  Widget loginBuilder() => StreamBuilder<bool>(
        initialData: false,
        builder: (context, snapshot) => Form(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new TextField(
                        onChanged: (phone) => phoneNumber = phone,
                        enabled: !snapshot.data,
                        style:
                            new TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                      new SizedBox(
                        height: 10.0,
                      ),
                      snapshot.data == false
                          ? new Offstage()
                          : new TextField(
                              onChanged: (myotp) => otp = myotp,
                              keyboardType: TextInputType.number,
                              style: new TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                              obscureText: true,
                            ),
                      new SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        child: snapshot.data == false
                            ? new GradientButton(
                                text: "get_otp",
                                onPressed: () {},
                              )
                            : new GradientButton(
                                onPressed: () {}, text: "login"),
                      ),
                      snapshot.data == true
                          ? new FlatButton(
                              child: Text("resend_otp"), onPressed: () => {})
                          : new Container()
                    ],
                  ),
                ),
              ),
            ),
      );

  Widget loginCard() {
    return Opacity(
      opacity: animation.value,
      child: SizedBox(
        height: deviceSize.height / 2 - 20,
        width: deviceSize.width * 0.85,
        child: new Card(
            color: Colors.white, elevation: 2.0, child: loginBuilder()),
      ),
    );
  }

  @override
  initState() {
    super.initState();
    controller = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 1500));
    animation = new Tween(begin: 0.0, end: 1.0).animate(
        new CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    animation.addListener(() => this.setState(() {}));
    controller.forward();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  showPhoneError(BuildContext context) {}

  showOTPError(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return loginCard();
  }
}

class GradientButton extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String text;

  GradientButton({@required this.onPressed, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      color: Colors.transparent,
      shape: const StadiumBorder(),
      child: InkWell(
        onTap: onPressed,
        splashColor: Colors.yellow,
        child: Ink(
          height: 50.0,
          decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              gradient: LinearGradient(
                colors: [Colors.blueGrey.shade800, Colors.black87],
              )),
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}
