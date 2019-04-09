import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_guru/screens/login/index.dart';
import 'package:flutter_guru/utils/authentication/index.dart';

class LoginForm1 extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;

  LoginForm1({
    Key key,
    @required this.loginBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<LoginForm1> createState() => _LoginForm1State();
}

class _LoginForm1State extends State<LoginForm1>
    with SingleTickerProviderStateMixin {
  TextEditingController _textEditingController = TextEditingController();
  String _mobile;
  bool _autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isTextFieldVisible = true;
  final _mobileController = TextEditingController();
  final _otpController = TextEditingController();
  LoginBloc get _loginBloc => widget.loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (
        BuildContext context,
        LoginState state,
      ) {
        if (state is LoginFailure) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.black,
              ),
            );
          });
        }

        return new Scaffold(
          backgroundColor: Colors.grey[300].withOpacity(0.7),
          body: new Stack(
            children: <Widget>[
              ClipPath(
                child: Container(
                  color: Colors.black26.withOpacity(0.8),
                ),
                clipper: GetClipper(),
              ),
              Positioned(
                width: 350.0,
                top: MediaQuery.of(context).size.height / 4,
                child: Column(
                  children: <Widget>[
                    // CircleAvatar(
                    //   backgroundImage: AssetImage('assets/300_3.jpg'),
                    //   radius: 60.0,
                    // )
                    Container(
                      width: 130.0,
                      height: 130.0,
                      decoration: BoxDecoration(
                          // color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage('assets/300_3.jpg'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(75.0)),
                          boxShadow: [
                            BoxShadow(blurRadius: 7.0, color: Colors.black)
                          ]),
                    ),
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 70.0, 0.0, 0.0),
                      child: Text(
                        'Universal Trading Solutions',
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                //  shrinkWrap: true,
                padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 420),
                child: Column(
                  children: <Widget>[
                    _isTextFieldVisible
                        ? TextFormField(
                            key: _formKey,
                            keyboardType: TextInputType.number,
                            // cursorColor: Colors.white,
                            // validator: (val) => val.length < 10
                            //     ? 'Number should be in 10-digits'
                            //     : null,
                            autovalidate: _autoValidate,

                            validator: validateMobile,
                            onSaved: (String value) {
                              print('Number is saved');
                            },
                            // onSaved: (String value) {
                            //   setState(() {
                            //     _mobile = value;
                            //   });
                            // },
                            maxLength: 10,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.phone_android),
                              labelText: 'Mobile',
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              hintText: 'Enter your Mobile Number',
                              //  hintStyle:TextStyle(color:Colors.white),
                            ),
                            controller: _mobileController,
                          )
                        : TextFormField(
                            keyboardType: TextInputType.number,
                            // validator: (val) => val.length < 4 ? 'Number Should be 4 digits' : null,
                            maxLength: 4,
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.refresh),
                                  tooltip: 'Resend OTP',
                                  onPressed: () {
                                    Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('ReSend OTP'),
                                      ),
                                    );
                                  },
                                ),
                                labelText: 'OTP',
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                                hintText: 'Enter your otp'),
                            controller: _otpController,
                          ),
                    _isTextFieldVisible
                        ? RaisedButton(
                            padding: EdgeInsets.only(
                                top: 15.0,
                                bottom: 15.0,
                                left: 55.0,
                                right: 55.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Text('Next'),
                            textColor: Colors.white,
                            color: Colors.black.withOpacity(0.8),
                            onPressed: () {
                              setState(() {
                                _isTextFieldVisible = !_isTextFieldVisible;
                              });
                            }

                            // textColor: Colors.white,
                            )
                        : RaisedButton(
                            padding: EdgeInsets.only(
                                top: 15.0,
                                bottom: 15.0,
                                left: 55.0,
                                right: 55.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            color: Colors.black.withOpacity(0.8),
                            onPressed: state is! LoginLoading
                                ? _onLoginButtonPressed
                                : null,
                            child: Text('Login'),
                            textColor: Colors.white,
                          ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );

    // return Form(
    //   child: Column(
    //     children: [
    //       TextFormField(
    //         decoration: InputDecoration(labelText: 'username'),
    //         controller: _usernameController,
    //       ),
    //       TextFormField(
    //         decoration: InputDecoration(labelText: 'password'),
    //         controller: _passwordController,
    //         obscureText: true,
    //       ),
    //       RaisedButton(
    //         onPressed:
    //             state is! LoginLoading ? _onLoginButtonPressed : null,
    //         child: Text('Login'),
    //       ),
    //       Container(
    //         child:
    //             state is LoginLoading ? CircularProgressIndicator() : null,
    //       ),
    //     ],
    //   ),
    // );
  }

// void _validateInputs() {
//   if (_formKey.currentState.validate()) {
// //    If all data are correct then save data to out variables
//     _formKey.currentState.save();
//   } else {
// //    If all data are not valid then start auto validation.
//     setState(() {
//       _autoValidate = true;
//     });
//   }
// }
  void _submitform() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey..currentState.save();
    final Map<String, dynamic> product = {'Mobile': _mobile};
  }

  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  _onLoginButtonPressed() {
    _loginBloc.dispatch(LoginButtonPressed(
      mobile: _mobileController.text,
      password: _otpController.text,
    ));
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0, 350);
    path.lineTo(500, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
