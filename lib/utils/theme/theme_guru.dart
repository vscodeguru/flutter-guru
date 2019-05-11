import 'package:flutter/material.dart';

mixin themeGuru {
  static Color primaryColor = HexColor('#466e7a');
  static Color secondaryColor = HexColor('#466e7a');

  static Color getColor (String hexColor) => HexColor(hexColor);
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
