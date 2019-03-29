import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_guru/screens/login/index.dart';
import 'package:flutter_guru/utils/authentication/index.dart';

class LoginForm2 extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;

  LoginForm2({
    Key key,
    @required this.loginBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<LoginForm2> createState() => _LoginForm2State();
}

class _LoginForm2State extends State<LoginForm2> {
  LoginBloc get _loginBloc => widget.loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (
        BuildContext context,
        LoginState state,
      ) {
        if (state is LoginFailure) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }

        return new Scaffold(
          body: ClipPath(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  decoration:
                      BoxDecoration(color: Color(0xff622F74), boxShadow: [
                    new BoxShadow(
                      color: Colors.black,
                      blurRadius: 100.0,
                    ),
                  ]),
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 90.0,
                          backgroundImage: AssetImage('assets/300_2.jpg')),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          "Flutter Guru",
                          style: TextStyle(color: Colors.white, fontSize: 24.0),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        "New York",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    )
                  ],
                ),
              ],
            ),
            clipper: GetClipper2(),
          ),
        );
        // body: new Padding(
        //   padding: EdgeInsets.all(8.0),
        //   child: new Center(
        //     child: new ClipPath(
        //       child: new ConstrainedBox(
        //         constraints: new BoxConstraints(
        //             minHeight: 400,
        //             minWidth: 400,
        //             maxHeight: 500,
        //             maxWidth: 400),
        //         child: new DecoratedBox(
        //           decoration: new BoxDecoration(
        //             color: Colors.blueGrey[50],
        //           ),
        //         ),
        //       ),
        //      clipper: GetClipper2(),
        //     ),
        //   ),
        // ),
        // body: ClipPath(
        //   child: Stack(
        //     fit: StackFit.expand,
        //     children: <Widget>[
        //       Container(
        //         decoration:
        //             BoxDecoration(color: Color(0xff622F74), boxShadow: [
        //           new BoxShadow(
        //             color: Colors.black,
        //             blurRadius: 100.0,
        //           ),
        //         ]),
        //       ),
        //       Column(
        //         children: <Widget>[
        //           Padding(
        //             padding: const EdgeInsets.only(top: 32.0),
        //             child: CircleAvatar(
        //                 backgroundColor: Colors.white,
        //                 radius: 90.0,
        //                 backgroundImage: AssetImage('assets/300_2.jpg')),
        //           ),
        //           Padding(
        //               padding: const EdgeInsets.all(3.0),
        //               child: Text(
        //                 "Flutter Guru",
        //                 style: TextStyle(color: Colors.white, fontSize: 24.0),
        //               )),
        //           Padding(
        //             padding: const EdgeInsets.all(3.0),
        //             child: Text(
        //               "New York",
        //               style: TextStyle(color: Colors.white, fontSize: 20.0),
        //             ),
        //           )
        //         ],
        //       )
        //     ],
        //   ),
        //   clipper: GetClipper2 (),
        // ),
      },
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}

class GetClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height - 400);
    path.lineTo(size.width, size.height - 280);
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
