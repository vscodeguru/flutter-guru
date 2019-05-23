import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/registration.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class LoggedInData {
  String sysid;
  String promotion;
  String name;
  String mobile;
  String apiKey;

  LoggedInData(
      {this.sysid, this.promotion, this.name, this.mobile, this.apiKey});

  factory LoggedInData.fromJson(Map<String, dynamic> parsedJson) {
    return LoggedInData(
        sysid: parsedJson['sysid'],
        promotion: parsedJson['promotion'],
        name: parsedJson['name'],
        mobile: parsedJson['mobile'],
        apiKey: parsedJson['apiKey']);
  }

  Map<String, dynamic> toJson() => {
        'sysid': sysid,
        'promotion': promotion,
        'name': name,
        'mobile': mobile,
        'apiKey': apiKey
      };
}

class ApplicationGlobalState with ChangeNotifier {
  RegistrationState registrationState;
  LoggedInData loggedInData;
  //static String apiServerUri = 'http://192.168.0.111:2531';
  static String apiServerUri = 'https://leads-api.302010.in';

  Future<void> setLoginData(LoggedInData _data) async {
    Directory dataDir = await pathProvider.getApplicationDocumentsDirectory();
    if (_data != null) {
      File('${dataDir.path}/auth.dat')
          .writeAsStringSync(json.encode(_data.toJson()));
    } else {
      File('${dataDir.path}/auth.dat').deleteSync();
    }
    loggedInData = _data;

    notifyListeners();
  }

  checkLoginData() async {
    Directory dataDir = await pathProvider.getApplicationDocumentsDirectory();
    if (File('${dataDir.path}/auth.dat').existsSync())
      loggedInData = LoggedInData.fromJson(
          json.decode(File('${dataDir.path}/auth.dat').readAsStringSync()));
  }

  ApplicationGlobalState() {}

  static ApplicationGlobalState of(BuildContext context) =>
      Provider.of<ApplicationGlobalState>(context);

  notify() {
    notifyListeners();
  }
}
