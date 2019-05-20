import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  bool salary = false;
  bool others = false;
  String other = '';
  clear()
  {
    investment = salary=others = false;
  }
  select(String selection) {
    investment = salary = false;
    if (selection == 'investment')
      investment = true;
    else
      salary = true;
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

  RegistrationState() {
    _data = RegistrationModel();
  }

  List<String> getCities() {
    var cities = new List<String>();
    cities = [
      'Salem',
      'Coimbatore',
      'Chennai',
      'Trichy',
      'Bangalore',
      'Kerala',
      'Kanyakumari',
      'Tirupur',
      'Jarkhand',
      'kozhikode',
      'Thiruvandram',
      'Kozhikode'
    ];
    //cities.sort();
    return cities;
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
