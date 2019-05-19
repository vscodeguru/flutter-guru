import 'package:flutter/material.dart';
import 'package:flutter_guru/newCode/screens/auth/Login/loginPage.dart';
import 'package:flutter_guru/newCode/screens/splashScreen.dart';
import 'package:flutter_guru/newCode/states/auth/login.dart';
import 'package:provider/provider.dart';
import './states/baseState.dart';


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
        theme: ThemeData(primarySwatch: Colors.teal),
          debugShowCheckedModeBanner: false,
          home: SplashScreenPage()),
    );
  }
}
