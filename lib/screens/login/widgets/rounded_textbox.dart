import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

TextField guruRoundedText( String hint,  Color pageThemeColor, IconData icon, TextEditingController textFieldController) {
  return TextField(
    
    controller: textFieldController,
    maxLength: 10,
    inputFormatters: [
      WhitelistingTextInputFormatter.digitsOnly,
    ],
    keyboardType: TextInputType.phone,
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.all(13.0),
      hintText: 'Enter your Number',
      suffixIcon: Icon(
        icon,
        color: pageThemeColor,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: pageThemeColor),
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: pageThemeColor),
        borderRadius: BorderRadius.all(
          Radius.circular(25.0),
        ),
      ),
    ),
    
  );
}

Text guruLabel(String text, Color pageThemeColor,
    {double fontSize: 18, fontWeight: FontWeight.bold}) {
  return Text(text,
      style: TextStyle(
          fontSize: fontSize, fontWeight: fontWeight, color: pageThemeColor));
}
