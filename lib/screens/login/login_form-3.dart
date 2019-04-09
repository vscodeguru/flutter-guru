import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_guru/screens/login/index.dart';
import 'package:flutter_guru/screens/login/widgets/login_background.dart';
import 'package:flutter_guru/screens/login/widgets/login_widget.dart';
import 'package:flutter_guru/utils/authentication/index.dart';

class LoginForm3 extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;

  LoginForm3({
    Key key,
    @required this.loginBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<LoginForm3> createState() => _LoginForm3State();
}

class _LoginForm3State extends State<LoginForm3> {
  LoginBloc get _loginBloc => widget.loginBloc;
  final PageController _loginPageControl = new PageController();
  bool _showOtpButtons = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (BuildContext context, LoginState state) {
        if (state is LoginFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.black,
              ),
            );
          });
        }
        return Scaffold(
          body: Container(
            color: HexColor("#314453"),
            // decoration: BoxDecoration(
            //   gradient: new LinearGradient(
            //       colors: [Color(0x000000), Color(0x000000)],
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter),
            // ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 50,
                  child: _buildTopContainer(context),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    // padding: EdgeInsets.only(bottom: 25),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Container(
                      // padding: EdgeInsets.all(30),
                      //margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        // borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: Stack(
                        children: <Widget>[
                          ClipShadowPath(
                            clipper: GetClipper(),
                            shadow: Shadow(
                                blurRadius: 20, color: HexColor("#171717")),
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor("#f2f2f2"),
                              ),
                              child: PageView(
                                physics: NeverScrollableScrollPhysics(),
                                controller: _loginPageControl,
                                children: <Widget>[
                                  _buildPhoneNumberContent(context),
                                  _buildOtpContent(context)
                                ],
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              // Center(
                              //   child: CircleAvatar(
                              //     backgroundImage:
                              //         AssetImage('assets/300_3.jpg'),
                              //     radius:
                              //         MediaQuery.of(context).size.width * 0.13,
                              //   ),
                              // ),
                              Stack(
                                children: <Widget>[
                                  Center(
                                    child: (!_showOtpButtons)
                                        ? RaisedButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            child: Text('Next'),
                                            textColor: Colors.white,
                                            color: Colors.black,
                                            onPressed: () {
                                              setState(() {
                                                this._showOtpButtons = true;
                                              });
                                              _loginPageControl.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 350),
                                                  curve: Curves.linear);
                                            }

                                            // textColor: Colors.white,
                                            )
                                        : _buildOtpButtonContent(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Row _buildOtpButtonContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Text('Go Back'),
            textColor: Colors.white,
            color: Colors.black,
            onPressed: () {
              setState(() {
                this._showOtpButtons = false;
              });
              _loginPageControl.previousPage(
                  duration: Duration(milliseconds: 350), curve: Curves.linear);
            }

            // textColor: Colors.white,
            ),
        RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Text('Login'),
            textColor: Colors.white,
            color: Colors.black,
            onPressed: () {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Login Clicked'),
                action: SnackBarAction(
                  label: 'Done',
                  onPressed: () {},
                ),
              ));
            }

            // textColor: Colors.white,
            ),
      ],
    );
  }

  Column _buildPhoneNumberContent(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Text(
          'Enter your Mobile Number',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.035,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            maxLength: 10,
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(13.0),
                hintText: 'Enter your Mobile Number',
                fillColor: Colors.grey[400],
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ))),
          ),
        ),
      ],
    );
  }

  Column _buildOtpContent(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Text(
          'Enter OTP Code',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.035,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            maxLength: 10,
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(13.0),
              hintText: 'Enter OTP Code',
              fillColor: Colors.grey[400],
              filled: true,
              suffixIcon: IconButton(
                  icon: Icon(Icons.refresh),
                  tooltip: 'Resend OTP',
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('ReSend OTP'),
                    ));
                  }),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  )),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container _buildTopContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                //boxShadow: [BoxShadow(blurRadius: 7.0, color: Colors.black)]
              ),
              padding: EdgeInsets.all(15),
              child: Image(
                image: AssetImage('assets/images/logo/UCF.png'),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Agent Portal",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
          ),
          Text(
            "Loren Ipsum",
            style: TextStyle(
              fontSize: 12,
            ),
          )
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

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.moveTo(0, size.height * 0.38);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

@immutable
class ClipShadowPath extends StatelessWidget {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  ClipShadowPath({
    @required this.shadow,
    @required this.clipper,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: this.clipper,
        shadow: this.shadow,
      ),
      child: ClipPath(child: child, clipper: this.clipper),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({@required this.shadow, @required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    canvas.drawPath(clipper.getClip(size), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
