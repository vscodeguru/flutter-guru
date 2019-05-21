import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_guru/states/baseState.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class DashboardModel {
  List<LeadsModel> leadsData;
}

class LeadsModel {
  String name;
  String profession = 'Employee';
  String avatar = 'assets/user.png';
  String phoneNumber = '123456798';
  String city = 'Salem';
  String date;
  String time;
  String carOwned = 'Yes';
  String bikeOwned = 'Yes';
  String houseType = 'Own House';
  String reason = 'Investment';
  LeadsModel({this.name, this.avatar, this.time});

  factory LeadsModel.fromJson(Map<String, dynamic> json) {
    var data = LeadsModel();
    data.name = json['contact_name'];
    data.phoneNumber = json['contact_mobile'];
    data.city = json['contact_city'];
    data.profession = json['contact_profession'];
    data.houseType = json['home_type']; //owned
    data.reason = json['purpose_type']; // personal
    data.carOwned = (json['is_car_owned']) ? 'Yes' : 'No'; // personal
    data.bikeOwned = json['is_two_wheeler_owned'] ? 'Yes' : 'No'; // personal
    data.date = json['appointment_date']; // personal
    data.time = json['appointment_time']; // personal
    return data;
  }
}

class DashboardState with ChangeNotifier {
  DashboardModel _data;
  DashboardModel get data => _data;
  LeadsModel selectedLead;
  String apiKey;
  DashboardState({this.apiKey}) {
    _data = DashboardModel();
    _data.leadsData = [];
  }

  Future<String> getLeadsData() async {
    String url = "${ApplicationGlobalState.apiServerUri}/lead/list";
    //String url ="http://192.168.0.115:2531/auth/validate-otp/$mobileNumber/$otp";

    http.Response response = await http.get(Uri.encodeFull(url),
        headers: {"Accept": "application/json", "X-API-KEY": apiKey});
    String responseBody = response.body;
    print(responseBody);
    var responseJson = json.decode(responseBody);
    if (responseJson['response'] == "success") {
      _data.leadsData = [];

      var results = (responseJson['success']['result']) as List<dynamic>;
      results.forEach((_result) {
        _data.leadsData.add(LeadsModel.fromJson(_result));
      });
      return Future.value('success');
    } else {
      return Future.value(responseJson['failure']['message']);
    }
  }

  Future<String> saveLeadData(LeadsModel data) async {
    String url = "${ApplicationGlobalState.apiServerUri}/lead/save";
    //String url ="http://192.168.0.115:2531/auth/validate-otp/$mobileNumber/$otp";
    Map<String, dynamic> postData = {
      'contact_name': data.name,
      'contact_mobile': data.phoneNumber,
      'contact_city': data.city,
      'contact_profession': data.profession,
      'home_type': data.houseType,
      'purpose_type': data.reason,
      'is_car_owned': (data.carOwned == 'Yes').toString(),
      'is_two_wheeler_owned': (data.bikeOwned == 'Yes').toString(),
      'appointment_date': data.date,
      'appointment_time': data.time
    };
    
    http.Response response = await http.post(Uri.encodeFull(url),
        headers: {"Content-Type": "application/json", "X-API-KEY": apiKey},
        body: json.encode(postData));
    String responseBody = response.body;
    print(responseBody);
    var responseJson = json.decode(responseBody);
    if (responseJson['response'] == "success") {
      return Future.value('success');
    } else {
      return Future.value(responseJson['failure']['message']);
    }
  }

  static DashboardState of(BuildContext context) =>
      Provider.of<DashboardState>(context);

  notify() {
    notifyListeners();
  }
}
