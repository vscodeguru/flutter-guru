import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegistrationModel {
  Registration_PersonalData _personal;
  Registration_HouseData _house;
  Registration_VechicleData _vehicle;
  Registration_PurposeData _purpose;

  Registration_PersonalData get personal => _personal;
  Registration_HouseData get house => _house;
  Registration_VechicleData get vehicle => _vehicle;
  Registration_PurposeData get purpose => _purpose;

  RegistrationModel() {
    _personal = Registration_PersonalData();
    _house = Registration_HouseData();
    _vehicle = Registration_VechicleData();
    _purpose = Registration_PurposeData();
  }
}

class Registration_PersonalData {
  String name = '';
  String mobile = '';
  String city = 'Salem';
  String profession = 'Employee';
}

class Registration_HouseData {
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

class Registration_VechicleData {
  bool car = false;
  bool bike = false;
}

class Registration_PurposeData {
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

class Registration_AppointmentData {}

class Registration_CustomerList {}

class Registration_ListData {}

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
