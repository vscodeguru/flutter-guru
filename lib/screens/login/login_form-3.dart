import 'package:flutter/material.dart';
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
          body: Stack(
            children: <Widget>[
              new Positioned(
                top: 0,
                child: new Image.asset('assets/300_3.jpg'),
              ),
              new Positioned(
                bottom: 0,
                child: Stack(
                  children: <Widget>[LoginWidgets()],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _loginbody() => SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[loginheader(), loginFields()],
        ),
      );
  loginheader() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          FlutterLogo(
            colors: Colors.green,
            size: 80.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text("Welcome",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.green))
        ],
      );

  loginFields() => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
              child: TextField(
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Enter your username",
                  labelText: "Username",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextField(
                maxLines: 1,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  labelText: "Password",
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(12.0),
                shape: StadiumBorder(),
                child: Text(
                  "SIGN IN",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.green,
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "SIGN UP FOR AN ACCOUNT",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
}
