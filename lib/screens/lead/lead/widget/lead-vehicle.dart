import 'package:flutter/cupertino.dart';
import 'package:flutter_guru/screens/lead/lead/index.dart';

class LeadVehicle extends StatelessWidget {
  LeadScreenState parent;

  LeadVehicle(this.parent);
  // const LeadVehicle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Text('Vehicle'),
    );
  }
}
