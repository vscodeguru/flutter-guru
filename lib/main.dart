import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_guru/newCode/ApplicationBase.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MainApplication());
  });
}

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ApplicationBase();
  }
}