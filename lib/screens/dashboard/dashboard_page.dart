import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_guru/utils/authentication/index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Fluttertoast.showToast(
      timeInSecForIos: 1,
      msg: 'Welcome !!',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: HexColor('#314453'),
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dashboard'),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              // top: 70,
              child: Container(
                height: 300,
                width: 400,
                child: Card(
                  elevation: 12.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Balance",
                              //   style: TextStyle(fontFamily: UIData.ralewayFont),
                            ),
                            Material(
                              color: Colors.black,
                              shape: StadiumBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "500 Points",
                                  style: TextStyle(
                                    color: Colors.white,
                                    //  fontFamily: UIData.ralewayFont),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "₹ 1000",
                          style: TextStyle(
                              //    fontFamily: UIData.ralewayFont,
                              fontWeight: FontWeight.w700,
                              color: Colors.green,
                              fontSize: 25.0),
                        ),
                        Row(
                         // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              child: Text('logout'),
                              onPressed: () {
                                authenticationBloc.dispatch(LoggedOut());
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
