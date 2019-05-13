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
  String name='';
  String mobile='';
  String city='';
  String profession='';
}

class Registration_HouseData {
  String blah='';
}
class Registration_VechicleData {
  String blah='';
}

class Registration_PurposeData {
  String blah='';
}

class RegistrationState with ChangeNotifier {

  RegistrationModel _data;

  int currentPage = 1;

  RegistrationModel get data => _data; // This is equalent to {get; private set;}

  RegistrationState()
  {
    _data = RegistrationModel();
  }

  static RegistrationState of(BuildContext context) =>
      Provider.of<RegistrationState>(context);

  notify()
  {
    notifyListeners();
  }


}
