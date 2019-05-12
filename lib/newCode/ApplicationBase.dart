import 'package:flutter/material.dart';
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
        home: ChangeNotifierProvider<RegistrationState>(
          builder: (ctx) => RegistrationState(),
          child: RegistrationPage(),
        ),
      ),
    );
  }
}
