import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginButtonPressed extends LoginEvent {
  final String mobile;
  final String password;

  LoginButtonPressed({
    @required this.mobile,
    @required this.password,
  }) : super([mobile, password]);

  @override
  String toString() =>
      'LoginButtonPressed { username: $mobile, password: $password }';
}
