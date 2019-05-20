import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_guru/ApplicationBase.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ApplicationBase());
  });
}
