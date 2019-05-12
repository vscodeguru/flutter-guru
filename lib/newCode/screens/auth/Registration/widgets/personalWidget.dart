import 'package:flutter/material.dart';
import '../../../../states/auth/registration.dart';
import 'package:provider/provider.dart';

class PersonalWidget extends StatelessWidget {
  String input = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('THIS IS PERSONAL PAGE'),
        Text('Data : ' + Provider.of<RegistrationState>(context).data.personal.Name),
        TextField(
          onChanged: (_input) {
            this.input = _input;
          },
        ),
        FlatButton(
          child: Text('Validate and Save'),
          onPressed: () {
            // IMA Do VALIDATIONS HERE
            Provider.of<RegistrationState>(context).data.personal.Name = input;
            
            Provider.of<RegistrationState>(context).notify();
          },
        )
      ],
    );
  }
}
