import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardModel {
  List<LeadsModel> leadsData;
}

class LeadsModel {
  String name;
  String profession = 'Employee';
  String avatar;
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
    data.leadsData = [LeadsModel(name: 'Owais',avatar: 'assets/300_2.jpg'),LeadsModel(name: 'Owais',avatar: 'assets/300_2.jpg')];
  }

  Future<bool> getLeadsData() async {
    List<LeadsModel> models = [LeadsModel(name: 'Owais',avatar: 'assets/300_2.jpg'),LeadsModel(name: 'Owais',avatar: 'assets/300_2.jpg')];
    _data.leadsData = models;
    return Future.value(true);

  }

    static DashboardState of(BuildContext context) =>
      Provider.of<DashboardState>(context);
}
