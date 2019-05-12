import 'dart:async';
import 'package:flutter_guru/screens/lead/lead/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LeadEvent {
  Future<LeadState> applyAsync({LeadState currentState, LeadBloc bloc});
  final LeadProvider _leadProvider = new LeadProvider();
}

class LoadLeadEvent extends LeadEvent {
  @override
  String toString() => 'LoadLeadEvent';

  @override
  Future<LeadState> applyAsync({LeadState currentState, LeadBloc bloc}) async {
    try {
      await Future.delayed(new Duration(seconds: 2));
      this._leadProvider.test();
      return new PersonalLeadState();
    } catch (_) {
      print('LoadLeadEvent ' + _?.toString());
      return new ErrorLeadState(_?.toString());
    }
  }
}

class HouseLeadEvent extends LeadEvent {
  @override
  String toString() => 'LoadLeadEvent';

  @override
  Future<LeadState> applyAsync({LeadState currentState, LeadBloc bloc}) async {
    try {
      await Future.delayed(new Duration(seconds: 2));
      this._leadProvider.test();
      return new HouseLeadState();
    } catch (_) {
      print('LoadLeadEvent ' + _?.toString());
      return new ErrorLeadState(_?.toString());
    }
  }
}
