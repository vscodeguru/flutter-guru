import 'package:flutter/material.dart';
import 'package:flutter_guru/states/baseState.dart';
import 'package:flutter_guru/states/dashboardState/dashboard.dart';
import 'package:provider/provider.dart';
import './widgets/listWidget.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
 

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DashboardState>(
      builder: (ctx) => DashboardState(apiKey: ApplicationGlobalState.of(context).loggedInData.apiKey),
      child: ListWidget(),
    );
  }
}
