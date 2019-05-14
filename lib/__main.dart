import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guru/screens/dashboard/expand.dart';
import 'package:flutter_guru/screens/dashboard/report.dart';
import 'package:flutter_guru/screens/dashboard/sample.dart';
import 'package:flutter_guru/screens/lead/lead/index.dart';
import 'package:flutter_guru/screens/login/index.dart';
import 'package:flutter_guru/screens/splash/index.dart';
import 'package:flutter_guru/utils/authentication/index.dart';
import 'package:flutter_guru/widgets/loading_indicator/index.dart';
import 'package:flutter_guru/screens/dashboard/usercard.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    print(error);
  }
}

void __main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    BlocSupervisor().delegate = SimpleBlocDelegate();
    runApp(App(userRepository: UserRepository()));
  });
}

class App extends StatefulWidget {
  final UserRepository userRepository;
  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AuthenticationBloc _authenticationBloc;
  UserRepository get _userRepository => widget.userRepository;

  @override
  void initState() {
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: _authenticationBloc,
      child: MaterialApp(
        routes: <String, WidgetBuilder>{
          "/card": (BuildContext context) => new Usercard(),
          "/report": (BuildContext context) => new Report(),
          "/expand": (BuildContext context) => new Expand(),
          "/sample": (BuildContext context) => new Sample(),
        },
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
          bloc: _authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationUninitialized) {
              return SplashPage();
            }
            if (state is AuthenticationAuthenticated) {
              return LeadPage();
            }
            if (state is AuthenticationUnauthenticated) {
              return LoginPage(userRepository: _userRepository);
            }
            if (state is AuthenticationLoading) {
              return LoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}