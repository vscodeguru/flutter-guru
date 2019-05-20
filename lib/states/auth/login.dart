import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_guru/states/baseState.dart';
import 'package:flutter_guru/states/dashboardState/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginModel {}

class LoginState with ChangeNotifier {
  String mobileNumber = '';

  static LoginState of(BuildContext context) =>
      Provider.of<LoginState>(context);

  Future<String> generateOtp(String key) async {
    //String url =        "http://192.168.0.115:2531/auth/send-otp/$mobileNumber/${Uri.encodeFull(key)}";
    String url = "https://leads-api.302010.in/auth/send-otp/$mobileNumber/${Uri.encodeFull(key)}";
    try {
      var response = await http
          .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
      String responseBody = response.body;
      print(responseBody);
      if (response.statusCode == 200) {
        var responseJson = json.decode(responseBody);
        if (responseJson['response'] == 'success') {
          mobileNumber = mobileNumber;
          return Future.value('success');
        }
        return Future.value(responseJson['failure']['message']);
      } else {
        return Future.value(
            'Something went wrong. \nResponse Code : ${response.statusCode}');
      }
    } on SocketException {
      return Future.value('Network Error..');
    }
  }

  Future<Map<String, Object>> validateOtp(String otp) async {
    String url = "https://leads-api.302010.in/auth/validate-otp/$mobileNumber/$otp";
     //String url ="http://192.168.0.115:2531/auth/validate-otp/$mobileNumber/$otp";

    http.Response response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    String responseBody = response.body;
    print(responseBody);
    var responseJson = json.decode(responseBody);
    if (responseJson['response'] == "success") {
      return Future.value({
        "response": responseJson['response'],
        "data": LoggedInData.fromJson(responseJson)
      });
    } else {
      return Future.value({"response": responseJson['response']});
    }
  }
}
