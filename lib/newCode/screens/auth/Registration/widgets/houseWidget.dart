import 'package:flutter/material.dart';
import '../../../../states/auth/registration.dart';
import 'package:provider/provider.dart';

class HouseWidget extends StatelessWidget {
  String input = '';
  var _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _inputController.text = Provider.of<RegistrationState>(context).data.house.blah;
    
    return Column(
      children: <Widget>[
        Text('THIS IS House PAGE'),
        Text('Data : ' +
            Provider.of<RegistrationState>(context).data.house.blah),
        TextField(
          controller: _inputController,
        ),
        FlatButton(
          child: Text('Validate and Save'),
          onPressed: () {
            // IMA Do VALIDATIONS HERE
            Provider.of<RegistrationState>(context).data.house.blah = _inputController.text;
            Provider.of<RegistrationState>(context).notify();
          },
        )
      ],
    );
  }
}
