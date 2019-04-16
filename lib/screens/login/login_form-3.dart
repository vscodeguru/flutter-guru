import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guru/screens/login/index.dart';
//  import 'package:flutter_guru/screens/login/widgets/rounded_textbox.dart';
import 'package:flutter_guru/utils/authentication/index.dart';
import 'package:http/http.dart' as http;

class LoginForm3 extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;
  LoginForm3({
    Key key,
    @required this.loginBloc,
    @required this.authenticationBloc,
  }) : super(key: key);
  @override
  State<LoginForm3> createState() => _LoginForm3State();
}

class Post {
  final int mobilenumber;

  Post({this.mobilenumber});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      mobilenumber: json['mobile'],
    );
  }
}

class _LoginForm3State extends State<LoginForm3>
    with SingleTickerProviderStateMixin {
  String displayValue = "";
  String otpValue = "";
  void onSubmitted(value) {
    setState(() => displayValue = value);
  }

  void submitted(String value) {
    setState(() => otpValue = value);
  }

  getData() async {
    String url = "http://192.168.0.114:2531/mobile/request-otp/CUSTOMER_OTP/" +
        displayValue;
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      String responseBody = response.body;
      var responseJson = json.decode(responseBody);
      mobile = responseJson['mobile'];
      setState(() {
        print(responseBody);
      });
    } else {
      print('Something went wrong. \nResponse Code : ${response.statusCode}');
    }
    // print('Sucess');
    // setState(() {
    //  var converdata = json.decode(response.body) ;
    // });
    // print(response.body);
  }

  // @override
  // void initState() {
  //   getData();
  // }

  otpData() async {
    print(otpValue);
    String url = "http://192.168.0.114:2531/mobile/validate-otp/CUSTOMER_OTP/" +
        displayValue +
        "/" +
        otpValue;
    print(url);
    http.Response response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    String responseBody = response.body;
    print(responseBody);
    var responseJson = json.decode(responseBody);
    if (responseJson['response'] == "success") {
      state is! LoginLoading ? _onLoginButtonPressed : null;
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Welcome to chit funds'),
        backgroundColor: HexColor("#314453"),
      ));
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Invalid OTP'),
        backgroundColor: HexColor("#314453"),
      ));
    }
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController _textFieldController = TextEditingController();
  TextEditingController textFieldController = TextEditingController();
  Color pageThemeColor = HexColor("#314453");
  FocusNode focusNode = FocusNode();
  String mobile;
  String otp;
  LoginBloc get _loginBloc => widget.loginBloc;
  final PageController _loginPageControl = new PageController();
  final _mobileController = TextEditingController();
  final _otpController = TextEditingController();
  bool _showOtpButtons = false;
  bool _isTextFieldVisible = true;
  bool _autoValidate = false;
  String verificationId;

  get state => null;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (BuildContext context, LoginState state) {
        if (state is LoginFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.black,
              ),
            );
          });
        }
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: InkWell(
            child: Container(
              color: pageThemeColor,
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
                            //    SizedBox(height: animation.value),
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
                                      _buildPhoneNumberContent(context),
                                      _buildOtpContent(context)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 35),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  _isTextFieldVisible
                                      ? Center(
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage: AssetImage(
                                                'assets/smartphone.png'),
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.10,
                                          ),
                                        )
                                      : Center(
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            backgroundImage:
                                                AssetImage('assets/chat.png'),
                                            radius: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.10,
                                          ),
                                        ),
                                ],
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
      },
    );
  }

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
        // guruLabel('Enter Your Mobile Number', pageThemeColor),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.035,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: TextFormField(
            // autofocus: true,
            // onFieldSubmitted: onSubmitted,
            autovalidate: _autoValidate,
            validator: validateMobile,
            controller: textFieldController,
            maxLength: 10,
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
          // child: guruRoundedText(
          //   '',
          //   pageThemeColor,
          //   Icons.phone_android,
          //   _textFieldController,
          // ),
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
                      //  Navigator.push(context, route)
                        onSubmitted(textFieldController.text);
                        validateInputs();
                        getData();
                        textFieldController.clear();
                        //     onSubmitted(displayValue);
                      });
                    })
                : _buildOtpContent),
      ],
    );
  }

  Column _buildOtpContent(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        // SizedBox(height: animation.value),
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
            //    autofocus: true,
            //  autovalidate: _autoValidate,
            validator: validateOTP,
            controller: _textFieldController,
            maxLength: 6,
            inputFormatters: [
              WhitelistingTextInputFormatter.digitsOnly,
            ],
            //    onFieldSubmitted: submitted,
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
                    getData();
                    Scaffold.of(context).showSnackBar(SnackBar(
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
            //   focusNode: focusNode,
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
                  setState(() {
                    // otpData();
                    _textFieldController.text = "";
                    _isTextFieldVisible = !_isTextFieldVisible;

                    this._showOtpButtons = false;
                  });
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
                  setState(() {
                    submitted(_textFieldController.text);
                    _validateInputs();
                    otpData();   
                  });
                }
                ), // }),
          ],
        ),
      ],
    );
  }

  Container _buildTopContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width * 0.32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              padding: EdgeInsets.all(15),
              child: Image(
                image: AssetImage('assets/images/logo/UCF.png'),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Agent Portal",
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

  void _validateInputs() {
    final form = formKey.currentState;
    if (form.validate()) {
      //   state is! LoginLoading ? _onLoginButtonPressed : null;
      form.save();
    } else {
      setState(() => _autoValidate = true);
    }
  }

  void validateInputs() {
    final form = formKey.currentState;
    if (form.validate()) {
      FocusScope.of(context).requestFocus(new FocusNode());
      //   otpData();
      this._showOtpButtons = false;
      _textFieldController.text = "";
      _isTextFieldVisible = !_isTextFieldVisible;
      _loginPageControl.nextPage(
          duration: Duration(milliseconds: 350), curve: Curves.linear);
      form.save();
    } else {
      setState(() => _autoValidate = true);
    }
  }

  get _onLoginButtonPressed {
    _loginBloc.dispatch(LoginButtonPressed(
      mobile: _mobileController.text,
      password: _otpController.text,
    ));
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
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

@immutable
class ClipShadowPath extends StatelessWidget {
  final Shadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  ClipShadowPath({
    @required this.shadow,
    @required this.clipper,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ClipShadowShadowPainter(
        clipper: this.clipper,
        shadow: this.shadow,
      ),
      child: ClipPath(child: child, clipper: this.clipper),
    );
  }
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({@required this.shadow, @required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    canvas.drawPath(clipper.getClip(size), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

String validateOTP(String value) {
  if (value.length == 0) {
    return "OTP is Required";
  } else if (value.length != 6) {
    return "OTP must be 6 digits";
  }
  return null;
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
