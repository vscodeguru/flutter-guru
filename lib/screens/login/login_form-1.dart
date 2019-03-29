import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_guru/screens/login/index.dart';
import 'package:flutter_guru/utils/authentication/index.dart';

class LoginForm1 extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;

  LoginForm1({
    Key key,
    @required this.loginBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<LoginForm1> createState() => _LoginForm1State();
}

class _LoginForm1State extends State<LoginForm1> {

  
  var cust = false;

  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginBloc get _loginBloc => widget.loginBloc;
  // final mobilenumber = TextField(
  //    controller: _usernameController,

  //   keyboardType: TextInputType.phone,
  //   autofocus: false,
  //   decoration: InputDecoration(
  //     labelText: 'Mobile',
  //     labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
  //     focusedBorder:
  //         UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
  //     hintText: 'Enter your Mobile Number',
  //     contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
  //   ),
  // );
  // final loginbutton = Padding(
  //   padding: EdgeInsets.only(left: 100.0),
  //   child: RaisedButton(
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
  //     onPressed: (
  //     ) {},
  //     color: Colors.black87,
  //     child: Text(
  //       'Next',
  //       style: TextStyle(
  //         color: Colors.white,
  //       ),
  //     ),
  //   ),
  // );

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
                backgroundColor: Colors.black,
              ),
            );
          });
        }

        return new Scaffold(
          backgroundColor: Colors.white24.withOpacity(0.8),
          body: new Stack(
            children: <Widget>[
              ClipPath(
                child: Container(
                  color: Colors.black26.withOpacity(0.8),
                ),
                clipper: GetClipper(),
              ),
              Positioned(
                width: 350.0,
                top: MediaQuery.of(context).size.height / 4,
                child: Column(
                  children: <Widget>[
                    // CircleAvatar(
                    //   backgroundImage: AssetImage('assets/300_3.jpg'),
                    //   radius: 60.0,
                    // )
                    Container(
                      alignment: Alignment.bottomRight,
                      width: 130.0,
                      height: 130.0,
                      decoration: BoxDecoration(
                          // color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage('assets/300_3.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(75.0)),
                          boxShadow: [
                            BoxShadow(blurRadius: 7.0, color: Colors.black)
                          ]),
                    ),
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 70.0, 0.0, 0.0),
                      child: Text(
                        'Universal Trading Solutions',
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 420),
                children: <Widget>[
                  TextFormField(
                   // cursorColor: Colors.white,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter some Text';
                      }
                    },
                    maxLength: 10,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                    autovalidate: true,
                    decoration: InputDecoration(
                      labelText: 'Mobile',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      hintText: 'Enter your Mobile Number',
                      //  hintStyle:TextStyle(color:Colors.white),
                    ),
                    controller: _mobileController,
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 20.0,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    color: Colors.black.withOpacity(0.8),
                    onPressed:
                      
                    state is! LoginLoading ? _onLoginButtonPressed : null,
                    child: Text('Next'),
                    textColor: Colors.white,
                  ),
                ],
              )
              // Container(
              //   padding: EdgeInsets.fromLTRB(10.0, 135, 0.0, 0.0),
              //   height: 40.0,
              //   child: Material(
              //     borderRadius: BorderRadius.circular(20.0),
              //     shadowColor: Colors.greenAccent,
              //     color: Colors.green,
              //     elevation: 7.0,
              //     child: RaisedButton(
              //       shape:RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20.0),
              //       ),
              //       color: Colors.green,
              //       onPressed: (){

              //       },
              //       child: Center(
              //         child: Text(
              //           'Submit'
              //         ),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        );

        // return Form(
        //   child: Column(
        //     children: [
        //       TextFormField(
        //         decoration: InputDecoration(labelText: 'username'),
        //         controller: _usernameController,
        //       ),
        //       TextFormField(
        //         decoration: InputDecoration(labelText: 'password'),
        //         controller: _passwordController,
        //         obscureText: true,
        //       ),
        //       RaisedButton(
        //         onPressed:
        //             state is! LoginLoading ? _onLoginButtonPressed : null,
        //         child: Text('Login'),
        //       ),
        //       Container(
        //         child:
        //             state is LoginLoading ? CircularProgressIndicator() : null,
        //       ),
        //     ],
        //   ),
        // );
      },
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  _onLoginButtonPressed() {
    _loginBloc.dispatch(LoginButtonPressed(
      mobile: _mobileController.text,
      password: _passwordController.text,
    ));
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, 330);
    path.lineTo(560, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
