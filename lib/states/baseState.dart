import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/registration.dart';

class LoggedInData {
  String sysid;
  String promotion;
  String name;
  String mobile;
  String apiKey;

  LoggedInData({this.sysid,this.promotion,this.name,this.mobile,this.apiKey});

  factory LoggedInData.fromJson(Map<String, dynamic> parsedJson){
    return LoggedInData(
      sysid: parsedJson['sysid'],
      promotion : parsedJson['promotion'],
      name : parsedJson ['name'],
      mobile : parsedJson ['mobile'],
      apiKey : parsedJson ['apiKey']
    );
  }
}

class ApplicationGlobalState with ChangeNotifier {
  RegistrationState registrationState;
  LoggedInData loggedInData;
  //RegistrationState get registrationState => _registrationState;
  setLoginData(LoggedInData _data)
  {
    
    loggedInData = _data;
    notifyListeners();
  }

  ApplicationGlobalState() {
    loggedInData = LoggedInData();
  }

  static ApplicationGlobalState of(BuildContext context) =>
      Provider.of<ApplicationGlobalState>(context);

  notify() {
    notifyListeners();
  }
}
