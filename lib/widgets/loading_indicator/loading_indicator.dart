import 'package:flutter/material.dart';
import 'package:flutter_guru/utils/theme/index.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: SpinKitDoubleBounce(
      itemBuilder: (_, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: index.isEven ? HexColor("#314453") : Colors.white,
          ),
        );
      },
    ));
  }
}
