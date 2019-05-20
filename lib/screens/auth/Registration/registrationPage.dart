import 'package:flutter/material.dart';
import 'package:flutter_guru/screens/auth/Registration/widgets/appointmentWidget.dart';
import 'package:flutter_guru/screens/auth/Registration/widgets/purposeWidget.dart';
import 'package:flutter_guru/states/auth/registration.dart';
import 'package:flutter_guru/screens/auth/Registration/widgets/houseWidget.dart';
import 'package:flutter_guru/screens/auth/Registration/widgets/personalWidget.dart';
import 'package:flutter_guru/screens/auth/Registration/widgets/vehicelWidget.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    RegistrationState state = RegistrationState.of(context);
    Widget currentSelection;
    switch (state.currentPage) {
      case 1:
        currentSelection = PersonalWidget();
        break;
      case 2:
        currentSelection = VehicleWidget();
        break;
      case 3:
        currentSelection = HouseWidget();
        break;
      case 4:
        currentSelection = PurposeWidget(); //PUIRPOSE
        break;
      case 5:
        currentSelection = AppointmentWidget();
        break;
    }

    return WillPopScope(onWillPop: onBackClick, child: currentSelection);
  }

  Future<bool> onBackClick() async {
    if (RegistrationState.of(context).currentPage == 1)
      return Future.value(true);
    else {
      RegistrationState.of(context).currentPage--;
      RegistrationState.of(context).notify();
      return Future.value(false);
    }
  }
}
