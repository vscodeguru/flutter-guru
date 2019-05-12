import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guru/screens/lead/lead/index.dart';

class LeadPersonal extends StatelessWidget {
  LeadScreenState parent;
  LeadBloc _leadBloc;

  LeadPersonal(this.parent, LeadBloc _leadBloc);
  // const LeadPersonal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new InkResponse(
      child: new Container(
        color: Colors.red,
        child: new Center(
          child: new Text("-"),
        ),
      ),
      onTap: () {
        this._leadBloc.dispatch(HouseLeadEvent());
      },
    );
  }
}
