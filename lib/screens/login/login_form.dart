import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_guru/screens/login/index.dart';
import 'package:flutter_guru/utils/authentication/index.dart';

class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;

  LoginForm({
    Key key,
    @required this.loginBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
          body: new Stack(
              children: <Widget>[
             
              Positioned(
                width: 400.0,
                top: MediaQuery.of(context).size.height / 5,
                child: Column(
                  children: <Widget>[
                    // CircleAvatar(
                    //   backgroundImage: AssetImage('assets/300_3.jpg'),
                    //   radius: 60.0,
                    // )
                    Container(
                      alignment: Alignment.bottomRight,
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage('assets/300_3.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(75.0)),
                          boxShadow: [
                            BoxShadow(blurRadius: 7.0, color: Colors.indigo)
                          ]),
                    ),
                  ],
                ),
              ),
                ClipPath(
                 child: Container(
                   
                   color: Colors.indigo.withOpacity(0.8),
                 ),
                 clipper: GetClipper()
               ),
              SingleChildScrollView(
                
                padding: EdgeInsets.fromLTRB(15.0, 385.0, 0.0, 0.0),
                child: TextField(
                   decoration: InputDecoration(
                      labelText: 'Enter your number',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green))),
                ),
                
              ),
              Container(
                height: 40.0,
                child: Material(

                ),
              )
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
      username: _usernameController.text,
      password: _passwordController.text,
    ));
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
     path.lineTo(500, 500);
     path.lineTo(-500, 500);
     path.lineTo(-500, 0);
     
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
