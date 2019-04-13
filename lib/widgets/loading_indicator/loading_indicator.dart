import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
        child: Center(
          child: SpinKitDoubleBounce(itemBuilder: (_, int index){
             
              return DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                   color: index.isEven ? HexColor("#314453") : Colors.white,
                   
                ),
              );
          },
            //child: Text('logout'),
            
          ),
        ),
      ),
      //   body:Container(

      //   Center(
      //     child: SpinKitRotatingPlain(itemBuilder: (_, int index) {
      //       return DecoratedBox(
      //         decoration: BoxDecoration(
      //           color: index.isEven ? HexColor("#314453") : Colors.green,
      //         ),
      //       );
      //     }),
      //   ),
      // ),
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
