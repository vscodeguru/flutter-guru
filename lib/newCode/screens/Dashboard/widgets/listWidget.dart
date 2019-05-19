import 'package:flutter/material.dart';
import 'package:flutter_guru/newCode/screens/Dashboard/widgets/listViewWidget.dart';
import 'package:flutter_guru/newCode/screens/auth/Registration/registrationPage.dart';
import 'package:flutter_guru/newCode/states/auth/registration.dart';
import 'package:flutter_guru/newCode/states/dashboardState/dashboard.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_guru/utils/launcher_helper.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key key}) : super(key: key);

  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: new FloatingActionButton(
        heroTag: null,
        elevation: 6,
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push<LeadsModel>(context, MaterialPageRoute(
            builder: (ctx) {
              return ChangeNotifierProvider<RegistrationState>(
                builder: (_ctx) => RegistrationState(),
                child: RegistrationPage(),
              );
            },
          )).then((data) {
            if (data != null) {
              DashboardState.of(context).data.leadsData.add(data);
              DashboardState.of(context).notify();
            }
          });
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
            top: 70,
            child: (DashboardState.of(context).data.leadsData.length != 0) ? (ListView.builder(
              itemCount: DashboardState.of(context).data.leadsData.length,
              itemBuilder: (ctx, index) {
                var data = DashboardState.of(context).data.leadsData[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20.0),
                    color: Colors.redAccent,
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction){
                    DashboardState.of(context).data.leadsData.removeAt(index);
                    DashboardState.of(context).notify();
                    Scaffold.of(ctx).showSnackBar(SnackBar(content: Text("Lead for ${data.name} is marked as Completed!")));
                  },
                  child: ExpansionTile(
                    title: ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/300_2.jpg'),
                        radius: MediaQuery.of(context).size.width * 0.07,
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
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FloatingActionButton(
                                mini: true,
                                heroTag: null,
                                elevation: 6,
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.teal,
                                child: Icon(Icons.phone),
                                onPressed: () {
                                  luncherHelper()
                                      .launchDialer(data.phoneNumber)
                                      .then((data) {
                                    if (!data) {
                                      _scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        content: Text('Cannot launch Dialer.'),
                                      ));
                                    }
                                  });
                                }),
                            FloatingActionButton(
                                mini: true,
                                heroTag: null,
                                elevation: 6,
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.teal,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 8, right: 4, top: 2, bottom: 10),
                                  child: Icon(
                                    FontAwesomeIcons.whatsapp,
                                    size: 30,
                                  ),
                                ),
                                onPressed: () {
                                  luncherHelper()
                                      .launchWhatsapp(data.phoneNumber)
                                      .then((data) {
                                    if (!data) {
                                      _scaffoldKey.currentState
                                          .showSnackBar(SnackBar(
                                        content:
                                            Text('Cannot launch WhatsApp.'),
                                      ));
                                    }
                                  });
                                }),
                            FloatingActionButton(
                              mini: true,
                              heroTag: null,
                              elevation: 6,
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.teal,
                              child: Icon(Icons.message),
                              onPressed: () {
                                luncherHelper()
                                    .launchMessager(data.phoneNumber)
                                    .then((data) {
                                  if (!data) {
                                    _scaffoldKey.currentState
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          'Cannot launch SMS Messaging Application.'),
                                    ));
                                  }
                                });
                              },
                            ),
                            RaisedButton(
                              child: Text('Show all Details'),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (ctx) {
                                    return ListViewWidget(data);
                                  },
                                ));
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            )):Container(child: Center(child: Text('Leads Data is Empty'),),),
          ),
        ],
      ),
    );
  }
}
