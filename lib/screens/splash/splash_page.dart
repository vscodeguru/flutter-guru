import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[400],
      // backgroundColor: HexColor("#314453"),
      // body: Stack(
      //   fit: StackFit.expand,
      //   children: <Widget>[
      //     Container(
      // //      decoration: BoxDecoration(color:HexColor("#314453")),
      //     ),
      //     Column(
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       children: <Widget>[
      //         Expanded(
      //           flex: 2,
      //           child: Container(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: <Widget>[
      //                 Container(
      //                   width: MediaQuery.of(context).size.width * 0.32,
      //                   decoration: BoxDecoration(
      //                     color: Colors.white,
      //                     borderRadius: BorderRadius.all(Radius.circular(15.0)),
      //                   ),
      //                   padding: EdgeInsets.all(15),
      //                   child: Image(
      //                     image: AssetImage('assets/images/logo/UCF.png'),
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: EdgeInsets.only(top: 10.0),
      //                 ),
      //                 Text(
      //                   'Agent Portal',
      //                   style: TextStyle(
      //                      // color: Colors.white,
      //                       fontSize: 24.0,
      //                       fontWeight: FontWeight.bold),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      // Expanded(
      //   flex: 1,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       CircularProgressIndicator(
      //           backgroundColor: HexColor("#314453")),
      //       Padding(padding: EdgeInsets.only(top: 20.0)),
      //       Text(
      //         'Agent Portal',
      //         style: TextStyle(
      //             color: Colors.white,
      //             fontSize: 18.0,
      //             fontWeight: FontWeight.bold),
      //       )
      //     ],
      //   ),
      // )
      //       ],
      //     )
      //   ],
      // ),
      body: Center(
        child: Container(
          height: 150,
          width: 150,
          child: Image(
            image: AssetImage('assets/images/logo/UCF.png'),
          ),
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
