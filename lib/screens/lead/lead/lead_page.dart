import 'package:flutter/material.dart';
import 'package:flutter_guru/screens/lead/lead/index.dart';

class LeadPage extends StatelessWidget {
  static const String routeName = "/lead";

  @override
  Widget build(BuildContext context) {
    var _leadBloc = new LeadBloc();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Lead"),
      ),
      body: new LeadScreen(leadBloc: _leadBloc),
    );
  }
}
