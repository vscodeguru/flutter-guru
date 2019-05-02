import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guru/screens/login/index.dart';
import 'package:flutter_guru/utils/authentication/index.dart';
import 'package:http/http.dart' as http;
import 'package:sms/sms.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

class _LoginForm3State extends State<LoginForm3>
    with SingleTickerProviderStateMixin {
  SmsReceiver receiver = new SmsReceiver();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String value = '';
  String getNumber = '';
  String getOtp = '';
  String mobile;
  String otp;
  TextEditingController textField = TextEditingController();
  TextEditingController _textFieldController = TextEditingController();
  // TextEditingController textFieldController = MaskedTextController(mask: '00000-00000');
  TextEditingController textFieldController = TextEditingController();
  Color pageThemeColor = HexColor("#314453");
  FocusNode focusNode = FocusNode();
  LoginBloc get _loginBloc => widget.loginBloc;
  final PageController _loginPageControl = new PageController();
  final _mobileController = TextEditingController();
  final _otpController = TextEditingController();
  bool _showOtpButtons = false;
  bool avatarVisible = true;
  bool _autoValidate = false;
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
                                  avatarVisible
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
            controller: textFieldController,
            maxLength: 10,
            //    buildCounter: (BuildContext context, { int currentLength, int maxLength, bool isFocused }) => null,
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
                        FocusScope.of(context).requestFocus(new FocusNode());
                        onSubmitted(textFieldController.text);
                        validateInputs();
                        getData();

                        textFieldController.clear();
                      });
                    },
                  )
                : _buildOtpContent),
      ],
    );
  }

  //OTP TextForm Field
  Column _buildOtpContent(BuildContext context) {
    receiver.onSmsReceived.listen((SmsMessage msg) {
      final otpRegex = RegExp(
          '((?:(?:otp|password) (?:is|\:|is :) ?)([a-z0-9]{4,6}))|(([a-z0-9]{4,6}) (?:is your|is the).?(?:otp|password))',
          multiLine: true,
          caseSensitive: false);
      _textFieldController.text =
          (otpRegex.allMatches(msg.body).map((m) => m.group(1)).first != null)
              ? (otpRegex.allMatches(msg.body).map((m) => m.group(2)).first)
              : (otpRegex.allMatches(msg.body).map((m) => m.group(4)).first);
      state is! LoginLoading ? _onLoginButtonPressed : print('Error');
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Welcome to chit funds'),
          backgroundColor: HexColor("#314453"),
        ),
      );
    });
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
            controller: _textFieldController,
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
                    _textFieldController.text = "";
                    avatarVisible = !avatarVisible;
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
              },
            ),
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

  //Get Value From Number Textfield
  void onSubmitted(value) {
    setState(() => getNumber = value);
  }

  //Get Value From OTP Textfield
  void submitted(String value) {
    setState(() => getOtp = value);
  }

//OnSubmit Form validation For Mobile
  void _validateInputs() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
    } else {
      setState(() => _autoValidate = true);
    }
  }

//OnSubmit Form validation For OTP
  void validateInputs() {
    final form = formKey.currentState;
    if (form.validate()) {
      this._showOtpButtons = false;
      _textFieldController.text = "";
      avatarVisible = !avatarVisible;
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

  // Validating Mobile Number
  String validateMobile(String value) {
    // String patttern = r'(^[0-9]*$)';
//  RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
      // } else if (!regExp.hasMatch(value)) {
      //   return "Mobile Number must be digits";
      // }
    }
    return null;
  }

  // Validating OTP Number
  String validateOTP(String value) {
    if (value.length == 0) {
      return "OTP is Required";
    } else if (value.length != 6) {
      return "OTP must be 6 digits";
    }
    return null;
  }

  // Getting number from API
  getData() async {
    String url = "http://192.168.0.114:2531/mobile/request-otp/CUSTOMER_OTP/" +
        getNumber;
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      String responseBody = response.body;
      var responseJson = json.decode(responseBody);
      mobile = responseJson['mobile'];
      setState(() {
        print(responseBody);
        Fluttertoast.showToast(
          timeInSecForIos: 1,
          msg: 'Please wait for your OTP',
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: HexColor('#314453'),
          textColor: Colors.white,
        );
      });
    } else {
      print('Something went wrong. \nResponse Code : ${response.statusCode}');
    }
  }

  // Validating OTP data from API
  otpData() async {
    print(getOtp);
    String url = "http://192.168.0.114:2531/mobile/validate-otp/CUSTOMER_OTP/" +
        getNumber +
        "/" +
        getOtp;
    print(url);
    http.Response response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    String responseBody = response.body;
    print(responseBody);
    var responseJson = json.decode(responseBody);
    if (responseJson['response'] == "success") {
      state is! LoginLoading ? _onLoginButtonPressed : null;
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Invalid OTP!!'),
        backgroundColor: HexColor("#314453"),
      ));
    }
  }
}

// Adding HexaDecimal Colors
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

//Adding Clipper
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

// Adding ClipShadow
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
