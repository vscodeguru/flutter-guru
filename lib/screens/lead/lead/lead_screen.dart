import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guru/screens/lead/lead/index.dart';
import 'package:flutter_guru/screens/lead/lead/widget/lead-personal.dart';
import 'package:flutter_guru/screens/lead/lead/widget/lead-vehicle.dart';

class LeadScreen extends StatefulWidget {
  const LeadScreen({
    Key key,
    @required LeadBloc leadBloc,
  })  : _leadBloc = leadBloc,
        super(key: key);

  final LeadBloc _leadBloc;

  @override
  LeadScreenState createState() {
    return new LeadScreenState(_leadBloc);
  }
}

class LeadScreenState extends State<LeadScreen> {
  final LeadBloc _leadBloc;

  LeadScreenState(this._leadBloc);

  @override
  void initState() {
    super.initState();
    this._leadBloc.dispatch(LoadLeadEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadEvent, LeadState>(
        bloc: widget._leadBloc,
        builder: (
          BuildContext context,
          LeadState currentState,
        ) {
          if (currentState is UnLeadState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorLeadState) {
            return new Container(
                child: new Center(
              child: new Text(currentState.errorMessage ?? 'Error'),
            ));
          }
          if (currentState is PersonalLeadState) {
            return new LeadPersonal(this, this._leadBloc);
          }
          if (currentState is VehicleLeadState) {
            return new LeadVehicle(this);
          }
          if (currentState is HouseLeadState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is PurposeLeadState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return new Container(
              child: new Center(
            child: new Text("Something Went Wrong Please Try Again"),
          ));
        });
  }
}
