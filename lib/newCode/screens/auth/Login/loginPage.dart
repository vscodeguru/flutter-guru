import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_guru/newCode/screens/Dashboard/dashboardPage.dart';
import 'package:flutter_guru/newCode/states/auth/login.dart';
import 'package:flutter_guru/newCode/states/baseState.dart';
import 'package:flutter_guru/newCode/states/dashboardState/dashboard.dart';
import 'package:flutter_guru/utils/theme/theme_guru.dart';
import 'package:flutter_guru/widgets/clipper/clipShadowPath.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sms_retriever/sms_retriever.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Color pageThemeColor = HexColor("#314453");
  final PageController _loginPageControl = new PageController();

  bool avatarVisible = true;
  bool _showOtpButtons = false;

  bool _autoValidate = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController tfcMobileNumber = TextEditingController();
  TextEditingController tfcOtp = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      //resizeToAvoidBottomPadding: false,
      body: InkWell(
        child: Container(
          color: HexColor('#1a6d76'),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 50,
                child: _buildTopContainer(context),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Stack(
                      children: <Widget>[
                        ClipShadowPath(
                          clipper: GetClipper(),
                          shadow: Shadow(
                              blurRadius: 20, color: HexColor("#171717")),
                          child: Container(
                            decoration: BoxDecoration(
                              color: HexColor("#f2f2f2"),
                            ),
                            child: Form(
                              key: formKey,
                              autovalidate: _autoValidate,
                              child: PageView(
                                physics: NeverScrollableScrollPhysics(),
                                controller: _loginPageControl,
                                children: <Widget>[
                                  RaisedButton(
                                    child: Text('Ellam Konja Kalam'),
                                    onPressed: () {
                                      ApplicationGlobalState.of(context)
                                              .mobileNumber = '9715162434';
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(
                                        builder: (ctx) {
                                          return ChangeNotifierProvider<
                                              DashboardState>(
                                            builder: (_ctx) => DashboardState(),
                                            child: DashboardPage(),
                                          );
                                        },
                                      ));
                                    },
                                  ),
                                  _buildPhoneNumberContent(context),
                                  _buildOtpContent(context)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _buildTopContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.52,
              padding: EdgeInsets.all(0),
              child: Image(
                image: AssetImage('assets/images/logo/UCF.png'),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }

//Mobile Number TextFormField
  Column _buildPhoneNumberContent(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Text(
          'Enter your Mobile Number',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: HexColor("#314453")),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.035,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: TextFormField(
            autovalidate: _autoValidate,
            validator: validateMobile,
            controller: tfcMobileNumber,
            maxLength: 10,
            buildCounter: (BuildContext context,
                    {int currentLength, int maxLength, bool isFocused}) =>
                null,
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(13.0),
              hintText: 'Enter your Number',
              suffixIcon: Icon(
                Icons.phone_android,
                color: pageThemeColor,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: pageThemeColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: pageThemeColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: (!_showOtpButtons)
                ? RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Text('Next'),
                    textColor: Colors.white,
                    color: HexColor("#314453"),
                    onPressed: () {
                      setState(() {
                        final form = formKey.currentState;
                        if (form.validate()) {
                          requestOtp();
                        } else {
                          setState(() => _autoValidate = true);
                        }
                      });
                    },
                  )
                : _buildOtpContent),
      ],
    );
  }

  listenOtp() async {
    String smsCode = await SmsRetriever.startListening();
    SmsRetriever.stopListening();
    final otpRegex = RegExp(
        '((?:(?:otp|password) (?:is|\:|is :) ?)([a-z0-9]{4,6}))|(([a-z0-9]{4,6}) (?:is your|is the).?(?:otp|password))',
        multiLine: true,
        caseSensitive: false);
    if (otpRegex.hasMatch(smsCode)) {
      setState(() {
        tfcOtp.text =
            (otpRegex.allMatches(smsCode).map((m) => m.group(1)).first != null)
                ? (otpRegex.allMatches(smsCode).map((m) => m.group(2)).first)
                : (otpRegex.allMatches(smsCode).map((m) => m.group(4)).first);
      });
      LoginState.of(context).validateOtp(tfcOtp.text).then((data) {
        if (data == 'success') {
          ApplicationGlobalState.of(context).mobileNumber =
              LoginState.of(context).mobileNumber;

          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (ctx) {
              return ChangeNotifierProvider<DashboardState>(
                builder: (_ctx) => DashboardState(),
                child: DashboardPage(),
              );
            },
          ));
        } else if (data == 'failure') {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text('Something went wrong, try again later..'),
              backgroundColor: HexColor("#314453"),
            ),
          );
        } else {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              content: Text(data),
              backgroundColor: HexColor("#314453"),
            ),
          );
        }
      });
    }
  }

  showLoadingMessage(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Row(
        children: <Widget>[
          Container(height: 23, width: 23, child: CircularProgressIndicator()),
          SizedBox(
            width: 10,
          ),
          Text(message)
        ],
      ),
    ));
  }

  showErrorMessage(String message) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: HexColor("#B00020"),
        content: Text(message),
      ),
    );
  }

  requestOtp() {
    LoginState.of(context).mobileNumber = tfcMobileNumber.text;
    FocusScope.of(context).requestFocus(new FocusNode());

    showLoadingMessage('Sending OTP...');

    SmsRetriever.getAppSignature().then((signature) {
      LoginState.of(context).generateOtp(signature).then((data) {
        _scaffoldKey.currentState.hideCurrentSnackBar();

        if (data == 'success') {
          _loginPageControl.nextPage(
              duration: Duration(milliseconds: 350), curve: Curves.linear);

          listenOtp();
          showLoadingMessage('Waiting for OTP...');
        } else if (data == 'failure') {
          showErrorMessage('Unable to Send OTP');
        } else {
          showErrorMessage(data);
        }
      });
    });
  }

  Column _buildOtpContent(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Text(
          'Enter OTP Code ',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: HexColor("#314453")),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.035,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: TextFormField(
            validator: validateOTP,
            controller: tfcOtp,
            maxLength: 6,
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(13.0),
              hintText: 'Enter OTP Code',
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: pageThemeColor,
                  ),
                  tooltip: 'Resend OTP',
                  onPressed: () {
                    requestOtp();
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text('ReSend OTP'),
                    ));
                  }),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: pageThemeColor),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  )),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: pageThemeColor),
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Text('Go Back'),
                textColor: Colors.white,
                color: HexColor("#314453"),
                onPressed: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                  setState(
                    () {
                      tfcOtp.text = "";
                      avatarVisible = !avatarVisible;
                      this._showOtpButtons = false;
                    },
                  );
                  _loginPageControl.previousPage(
                      duration: Duration(milliseconds: 350),
                      curve: Curves.linear);
                }),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Text('Login'),
              textColor: Colors.white,
              color: HexColor("#314453"),
              onPressed: () {
                // setState(() {
                //   state is! LoginLoading
                //       ? _onLoginButtonPressed
                //       : print('Error');
                //   //    submitted(_textFieldController.text);
                //   //   _validateInputs();
                //   //  otpData();
                // });
              },
            ),
          ],
        ),
      ],
    );
  }

  String validateMobile(String value) {
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    }
    return null;
  }

  String validateOTP(String value) {
    if (value.length == 0) {
      return "OTP is Required";
    } else if (value.length != 6) {
      return "OTP must be 6 digits";
    }
    return null;
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.moveTo(0, size.height * 0.38);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class sms {
  static const MethodChannel _channel = const MethodChannel('sms_autofill');
  final StreamController<String> _code = StreamController.broadcast();
}
