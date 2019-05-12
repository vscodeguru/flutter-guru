import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/registration.dart';

class ApplicationGlobalState with ChangeNotifier {
  RegistrationState registrationState;
  //RegistrationState get registrationState => _registrationState;

  ApplicationGlobalState() {
    //_registrationState = RegistrationState();
  }

  static ApplicationGlobalState of(BuildContext context) => Provider.of<ApplicationGlobalState>(context);
  notify()
  {
    notifyListeners();
  }
}
