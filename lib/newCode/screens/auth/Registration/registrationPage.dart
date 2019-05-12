import 'package:flutter/material.dart';
import '../../../states/auth/registration.dart';
import 'widgets/houseWidget.dart';
import 'widgets/personalWidget.dart';
import 'widgets/vehicelWidget.dart';

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
      currentSelection = HouseWidget();
        break;
      case 3:
      currentSelection = VehicleWidget();
        break;
        case 4:
        currentSelection = Column(children: <Widget>[
          Text('Name : ' + state.data.personal.Name),
          Text('House Blah : ' + state.data.house.blah),
          Text('Vehicle Blah : ' + state.data.vehicle.blah)
        ],);
        break;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Registration Page'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: currentSelection,
            ),
          ],
        ));
  }
}
