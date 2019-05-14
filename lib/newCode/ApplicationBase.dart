import 'package:flutter/material.dart';
import 'package:flutter_guru/newCode/states/auth/login.dart';
import 'screens/auth/Login/loginPage.dart';

import 'package:provider/provider.dart';
import './states/baseState.dart';

import './screens/auth/Registration/registrationPage.dart';
import 'states/auth/registration.dart';

class ApplicationBase extends StatefulWidget {
  @override
  _ApplicationBaseState createState() => _ApplicationBaseState();
}

class _ApplicationBaseState extends State<ApplicationBase> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplicationGlobalState>(
      builder: (ctx) => ApplicationGlobalState(),
      child: MaterialApp(
        home: ChangeNotifierProvider<LoginState>(
          builder: (ctx) => LoginState(),
          child: LoginPage(),
        ),
      ),
    );
  }
}
