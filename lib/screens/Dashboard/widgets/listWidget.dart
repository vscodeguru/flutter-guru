import 'package:flutter/material.dart';
import 'package:flutter_guru/screens/Dashboard/widgets/listViewWidget.dart';
import 'package:flutter_guru/screens/auth/Registration/registrationPage.dart';
import 'package:flutter_guru/states/auth/registration.dart';
import 'package:flutter_guru/states/baseState.dart';
import 'package:flutter_guru/states/dashboardState/dashboard.dart';
import 'package:flutter_guru/utils/theme/index.dart';
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
  GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  DateTime closeButtonHandler;
  Future<bool> doubleTap() async {
    if (closeButtonHandler == null) {
      closeButtonHandler = DateTime.now();
      _scaffoldKey.currentState.showSnackBar(
        new SnackBar(
          content: new Text('Tap Again to close'),
          duration: Duration(milliseconds: 1800),
        ),
      );
    } else if (closeButtonHandler != null &&
        (DateTime.now().difference(closeButtonHandler).inSeconds < 2)) {
      return Future.value(true);
    } else if (closeButtonHandler != null &&
        (DateTime.now().difference(closeButtonHandler).inSeconds > 2)) {
      closeButtonHandler = DateTime.now();
      _scaffoldKey.currentState.showSnackBar(
        new SnackBar(
          content: new Text('Tap Again to close'),
          duration: Duration(milliseconds: 1800),
        ),
      );
    }
    return Future.value(false);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadData();
    });
  }

  Future<void> loadData() async {
    _scaffoldKey.currentState.hideCurrentSnackBar();
    showLoadingMessage(message: 'Loading Data..');

    String data = await DashboardState.of(context).getLeadsData();
    if (data == 'success') {
      _scaffoldKey.currentState.hideCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Data Updated!'),
      ));
      DashboardState.of(context).notify();
    } else {
      showErrorMessage(message: data);
    }
  }

  showLoadingMessage(
      {String message, Duration duration = const Duration(minutes: 1)}) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Row(
        children: <Widget>[
          Container(height: 23, width: 23, child: CircularProgressIndicator()),
          SizedBox(
            width: 10,
          ),
          Text(message)
        ],
      ),
      duration: duration,
    ));
  }

  showErrorMessage(
      {String message, Duration duration = const Duration(seconds: 5)}) {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        backgroundColor: HexColor("#B00020"),
        content: Text(message),
        duration: duration,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: doubleTap,
      child: Scaffold(
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
                  builder: (_ctx) => RegistrationState(
                      apiKey: ApplicationGlobalState.of(context)
                          .loggedInData
                          .apiKey),
                  child: RegistrationPage(),
                );
              },
            )).then((data) async {
              if (data != null) {
                showLoadingMessage(message: 'Saving lead Data..');
                String result =
                    await DashboardState.of(context).saveLeadData(data);
                if (result == 'success')
                  loadData();
                else
                  showErrorMessage(message: result);
              }
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 80,
                    decoration: new BoxDecoration(
                      color: Colors.teal,
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
            Expanded(
              child: RefreshIndicator(
                key: _refreshIndicatorKey,
                onRefresh: () => loadData(),
                child: (DashboardState.of(context).data.leadsData.length != 0)
                    ? (ListView.builder(
                        itemCount:
                            DashboardState.of(context).data.leadsData.length,
                        itemBuilder: (ctx, index) {
                          var data =
                              DashboardState.of(context).data.leadsData[index];
                          return Dismissible(
                            key: UniqueKey(),
                            background: Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 20.0),
                              color: Colors.redAccent,
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (direction) async {
                              DashboardState.of(context)
                                  .data
                                  .leadsData
                                  .removeAt(index);
                              DashboardState.of(context).notify();
                              Scaffold.of(ctx).hideCurrentSnackBar();
                              Scaffold.of(ctx).showSnackBar(SnackBar(
                                  content: Text(
                                      "Lead for ${data.name} is marked as Completed!")));
                            },
                            child: ExpansionTile(
                              title: ListTile(
                                contentPadding: EdgeInsets.all(0),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage:
                                      AssetImage('assets/user.png'),
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
                                //trailing: Text('12:45 PM'),
                              ),
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      FloatingActionButton(
                                          mini: true,
                                          heroTag: null,
                                          elevation: 6,
                                          foregroundColor: Colors.white,
                                          backgroundColor: Colors.teal,
                                          child: Icon(Icons.phone),
                                          onPressed: () {
                                            LuncherHelper()
                                                .launchDialer(data.phoneNumber)
                                                .then((data) {
                                              if (!data) {
                                                _scaffoldKey.currentState
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'Cannot launch Dialer.'),
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
                                                left: 8,
                                                right: 4,
                                                top: 2,
                                                bottom: 10),
                                            child: Icon(
                                              FontAwesomeIcons.whatsapp,
                                              size: 30,
                                            ),
                                          ),
                                          onPressed: () {
                                            LuncherHelper()
                                                .launchWhatsapp(
                                                    data.phoneNumber)
                                                .then((data) {
                                              if (!data) {
                                                _scaffoldKey.currentState
                                                    .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'Cannot launch WhatsApp.'),
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
                                          LuncherHelper()
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
                                          Navigator.push(context,
                                              MaterialPageRoute(
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
                      ))
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Text('Leads Data is Empty'),
                            SizedBox(height: 10),
                            RaisedButton(
                              child: Text('Refresh Data'),
                              onPressed: () {
                                _scaffoldKey.currentState.hideCurrentSnackBar();
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  duration: Duration(seconds: 10),
                                  content: Text('Fetching Data..'),
                                ));
                                _refreshIndicatorKey.currentState.widget
                                    .onRefresh();
                              },
                            )
                          ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
