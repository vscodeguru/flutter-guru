import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginModel {}

class LoginState with ChangeNotifier {
  String mobileNumber = '';

  static LoginState of(BuildContext context) =>
      Provider.of<LoginState>(context);

  Future<String> generateOtp() async {
    String url = "https://leads-api.302010.in/mobile/request-otp/CUSTOMER_OTP/" +
        mobileNumber;
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
        return Future.value('failure');
      } else {
        return Future.value(
            'Something went wrong. \nResponse Code : ${response.statusCode}');
      }
    } on SocketException{
      return Future.value('Network Error..');
    }
  }

  Future<String> validateOtp(String otp) async {
    String url = "https://leads-api.302010.in/mobile/validate-otp/CUSTOMER_OTP/" +
        mobileNumber +
        "/" +
        otp;
    http.Response response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    String responseBody = response.body;
    print(responseBody);
    var responseJson = json.decode(responseBody);
    if (responseJson['response'] == "success") {
      return Future.value('success');
    } else {
      return Future.value('failure');
    }
  }
}
