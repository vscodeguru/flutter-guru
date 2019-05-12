import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_guru/screens/lead/lead/index.dart';

class LeadBloc extends Bloc<LeadEvent, LeadState> {
  static final LeadBloc _leadBlocSingleton = new LeadBloc._internal();
  factory LeadBloc() {
    return _leadBlocSingleton;
  }
  LeadBloc._internal();
  
  LeadState get initialState => new UnLeadState();

  @override
  Stream<LeadState> mapEventToState(
    LeadEvent event,
  ) async* {
    try {
      yield await event.applyAsync(currentState: currentState, bloc: this);
    } catch (_) {
      print('LeadBloc ' + _?.toString());
      yield currentState;
    }
  }
}
