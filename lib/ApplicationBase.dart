import 'package:flutter/material.dart';
import 'package:flutter_guru/screens/splashScreen.dart';
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
