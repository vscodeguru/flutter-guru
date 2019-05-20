import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardModel {
  List<LeadsModel> leadsData;
}

class LeadsModel {
  String name;
  String profession = 'Employee';
  String avatar='assets/user.png';
  String phoneNumber = '123456798';
  String city = 'Salem';
  String time;
  String carOwned = 'Yes';
  String bikeOwned = 'Yes';
  String houseType = 'Own House';
  String reason = 'Investment';
  LeadsModel({this.name,this.avatar,  this.time});
}

class DashboardState with ChangeNotifier {

  DashboardModel _data;
  DashboardModel get data=>_data;
  LeadsModel selectedLead;
  DashboardState()
  {
    _data = DashboardModel();
    data.leadsData = [LeadsModel(name: 'Owais',avatar: 'assets/user.png'),LeadsModel(name: 'Owais',avatar: 'assets/user.png')];
  }

  Future<bool> getLeadsData() async {
    List<LeadsModel> models = [LeadsModel(name: 'Owais',avatar: 'assets/user.png'),LeadsModel(name: 'Owais',avatar: 'assets/user.png')];
    _data.leadsData += models;
    return Future.delayed(const Duration(seconds: 2), () => true);
  }

    static DashboardState of(BuildContext context) =>
      Provider.of<DashboardState>(context);

    notify(){
      notifyListeners();
    }
}
