import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
bool _autoValidate = false;

TextFormField guruRoundedText(String hint, Color pageThemeColor, IconData icon,
    TextEditingController textFieldController) {
  return TextFormField(
   // autofocus: true,
    autovalidate: _autoValidate,
    validator: validateMobile,
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

String validateMobile(String value) {
  String patttern = r'(^[0-9]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Mobile is Required";
  } else if (value.length != 10) {
    return "Mobile number must 10 digits";
  } else if (!regExp.hasMatch(value)) {
    return "Mobile Number must be digits";
  }
  return null;
}
