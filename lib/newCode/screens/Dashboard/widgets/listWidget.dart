import 'package:flutter/material.dart';
import 'package:flutter_guru/newCode/screens/Dashboard/widgets/listViewWidget.dart';
import 'package:flutter_guru/newCode/screens/auth/Registration/registrationPage.dart';
import 'package:flutter_guru/newCode/states/auth/registration.dart';
import 'package:flutter_guru/newCode/states/dashboardState/dashboard.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        heroTag: null,
        elevation: 6,
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (ctx) {
              return ChangeNotifierProvider<RegistrationState>(
                builder: (_ctx) => RegistrationState(),
                child: RegistrationPage(),
              );
            },
          ));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
                // image: new DecorationImage(
                //   image: new AssetImage("assets/Noel.png"),
                //   fit: BoxFit.cover,
                // ),
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  //    color: HexColor('#2980b9'),
                  //  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 80,
                        decoration: new BoxDecoration(
                          color: Colors.teal,
                          // color: HexColor('#1a6d75').withOpacity(0.8),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 7.0),
                                blurRadius: 3),
                          ],
                        ),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        ' Details',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 60,
                ),
                Column(
                  children: DashboardState.of(context)
                      .data
                      .leadsData
                      .map<Widget>(
                        (data) => GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (ctx) {
                                    return ListViewWidget(data);
                                  },
                                ));
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(data.avatar),
                                  radius:
                                      MediaQuery.of(context).size.width * 0.07,
                                ),
                                title: new Text(
                                  data.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  data.profession,
                                ),
                                trailing: Text('12:45 PM'),
                              ),
                            ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
