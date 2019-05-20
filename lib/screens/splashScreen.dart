import 'package:flutter/material.dart';
import 'package:flutter_guru/states/auth/login.dart';
import 'package:flutter_guru/screens/auth/Login/loginPage.dart';
import 'package:package_info/package_info.dart';

import 'package:flutter_guru/utils/theme/index.dart';
import 'package:flutter_guru/widgets/loading_indicator/loading_indicator.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:launch_review/launch_review.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  Future<String> checkVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String url = "https://leads-api.302010.in/mobile/check-version/" +
        packageInfo.version;
    try {
      var response = await http
          .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
      String responseBody = response.body;
      print(responseBody);
      if (response.statusCode == 200) {
        var responseJson = json.decode(responseBody);
        if (responseJson['response'] == 'success') {
          if (responseJson['success']['result']['status'] == 'ACTIVE')
            return Future.value('success');
        }
        return Future.value('failure');
      } else {
        return Future.value(
            'Something went wrong. \nResponse Code : ${response.statusCode}');
      }
    } catch (e) {
      return Future.value('Network Error..');
    }
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String msg;
  @override
  Widget build(BuildContext context) {
    checkVersion().then((data) {
      if (data == 'success') {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (ctx) {
            return ChangeNotifierProvider<LoginState>(
              builder: (_ctx) => LoginState(),
              child: LoginPage(),
            );
          },
        ));
      } else if (data == 'failure') {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Notification"),
              content: new Text("Critical Update available, please update."),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Update"),
                  onPressed: () {
                    LaunchReview.launch();
                  },
                ),
              ],
            );
          },
        );
        
      } else {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(data),
          duration: Duration(minutes: 1),
        ));

        setState(() {
          msg = ('Error : ' + data);
        });
      }
    });
    return Scaffold(
      backgroundColor: HexColor('#1a6d76'),
      key: _scaffoldKey,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.52,
              padding: EdgeInsets.all(0),
              child: Image(
                image: AssetImage('assets/images/logo/UCF.png'),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            (msg == null) ? LoadingIndicator() : Container()
          ],
        ),
      ),
    );
  }
}
