import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../baseState.dart';

class RegistrationModel {
  RegistrationPersonalData _personal;
  RegistrationHouseData _house;
  RegistrationVechicleData _vehicle;
  RegistrationPurposeData _purpose;

  RegistrationPersonalData get personal => _personal;
  RegistrationHouseData get house => _house;
  RegistrationVechicleData get vehicle => _vehicle;
  RegistrationPurposeData get purpose => _purpose;

  RegistrationModel() {
    _personal = RegistrationPersonalData();
    _house = RegistrationHouseData();
    _vehicle = RegistrationVechicleData();
    _purpose = RegistrationPurposeData();
  }
}

class RegistrationPersonalData {
  String name = '';
  String mobile = '';
  String city = 'Salem';
  String profession = 'Employee';
}

class RegistrationHouseData {
  bool own = false;
  bool rent = false;
  select(String selection) {
    own = rent = false;
    if (selection == 'own')
      own = true;
    else if (selection == 'rent')
      rent = true;
  }
}

class RegistrationVechicleData {
  bool car = false;
  bool bike = false;
}

class RegistrationPurposeData {
  bool investment = false;
  bool savings = false;
  bool others = false;
  String other = '';
  clear()
  {
    investment = savings=others = false;
  }
  select(String selection) {
    investment = savings = false;
    if (selection == 'investment')
      investment = true;
    else
      savings = true;
  }
}

class RegistrationAppointmentData {}

class RegistrationCustomerList {}

class RegistrationListData {}

class RegistrationState with ChangeNotifier {
  RegistrationModel _data;

  int currentPage = 1;

  RegistrationModel get data =>
      _data; // This is equalent to {get; private set;}

  String apiKey;
  RegistrationState({this.apiKey}) {
    _data = RegistrationModel();
  }
  List<String> cities;
  Future<String> getCities() async{
    cities = [];
    String url = "${ApplicationGlobalState.apiServerUri}/common/city";
    //String url ="http://192.168.0.115:2531/auth/validate-otp/$mobileNumber/$otp";

    http.Response response = await http.get(Uri.encodeFull(url),
        headers: {"Accept": "application/json", "X-API-KEY": apiKey});
    String responseBody = response.body;
    print(responseBody);
    var responseJson = json.decode(responseBody);
    if (responseJson['response'] == "success") {
      

      var results = (responseJson['success']['result']) as List<dynamic>;
      results.forEach((_result) {
        cities.add(_result['districtname']);
      });
      return Future.value('success');
    } else {
      return Future.value(responseJson['failure']['message']);
    }
  }

  List<String> getProfession() {
    var profession = new List<String>();
    profession = [
      'Employee',
      'Business',
      'Goverment Employee',
      'Self Employee'
    ];
    //profession.sort();
    return profession;
  }

  static RegistrationState of(BuildContext context) =>
      Provider.of<RegistrationState>(context);

  notify() {
    notifyListeners();
  }
}
