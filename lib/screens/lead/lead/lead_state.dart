import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LeadState extends Equatable {
  LeadState([Iterable props]) : super(props);

  /// Copy object for use in action
  LeadState getStateCopy();
}

/// UnInitialized
class UnLeadState extends LeadState {
  @override
  String toString() => 'UnLeadState';

  @override
  LeadState getStateCopy() {
    return UnLeadState();
  }
}

/// Initialized
class InLeadState extends LeadState {
  @override
  String toString() => 'InLeadState';

  @override
  LeadState getStateCopy() {
    return InLeadState();
  }
}

class ErrorLeadState extends LeadState {
  final String errorMessage;

  ErrorLeadState(this.errorMessage);

  @override
  String toString() => 'ErrorLeadState';

  @override
  LeadState getStateCopy() {
    return ErrorLeadState(this.errorMessage);
  }
}

/// Personal
class PersonalLeadState extends LeadState {
  @override
  String toString() => 'PersonalLeadState';

  @override
  LeadState getStateCopy() {
    return PersonalLeadState();
  }
}

/// Vehicle
class VehicleLeadState extends LeadState {
  @override
  String toString() => 'VehicleLeadState';

  @override
  LeadState getStateCopy() {
    return VehicleLeadState();
  }
}

/// House
class HouseLeadState extends LeadState {
  @override
  String toString() => 'HouseLeadState';

  @override
  LeadState getStateCopy() {
    return HouseLeadState();
  }
}

/// Purpose
class PurposeLeadState extends LeadState {
  @override
  String toString() => 'PurposeLeadState';

  @override
  LeadState getStateCopy() {
    return PurposeLeadState();
  }
}
