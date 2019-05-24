import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_guru/utils/theme/index.dart';
import 'package:flutter_guru/widgets/loading_indicator/index.dart';
import 'package:flutter_guru/widgets/searchableDropdown/searchableDropdown.dart';
import 'package:flutter_guru/states/auth/registration.dart';

class NoKeyboardEditableTextFocusNode extends FocusNode {
  @override
  bool consumeKeyboardToken() {
    // prevents keyboard from showing on first focus
    return false;
  }
}

class PersonalWidget extends StatefulWidget {
  PersonalWidget({
    Key key,
  }) : super(key: key);
  @override
  _PersonalWidgetState createState() => _PersonalWidgetState();
}

class _PersonalWidgetState extends State<PersonalWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  List<String> cities = [];
  List<String> profession;

  bool firstSearch = true;
  var tecNameController = TextEditingController();
  var tecMobileController = TextEditingController();
  final FocusNode fnNameFocus = FocusNode();
  final FocusNode fnMobileFocus = FocusNode();
  final FocusNode fnCityFocus = FocusNode();
  final FocusNode fnProfessionFocus = FocusNode();

  String selectedCity;
  String selectedProfession;

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
  void initState() {
    super.initState();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    if (cities.length == 0) {
      RegistrationState.of(context).getCities().then((data) {
        if (data == 'success') {
          setState(() {
            if (selectedCity == null) selectedCity = RegistrationState.of(context).cities[0];
            cities = RegistrationState.of(context).cities;
            
          });
        } else {
          showErrorMessage(message: data);
        }
      });
    }
    profession = (profession == null)
        ? RegistrationState.of(context).getProfession()
        : profession;

    if (selectedProfession == null) selectedProfession = profession[0];

    if (tecNameController.text == '')
      tecNameController.text = RegistrationState.of(context).data.personal.name;
    if (tecMobileController.text == '')
      tecMobileController.text =
          RegistrationState.of(context).data.personal.mobile;
    if (selectedCity == 'Salem')
      selectedCity = RegistrationState.of(context).data.personal.city;
    if (selectedProfession == 'Employee')
      selectedProfession =
          RegistrationState.of(context).data.personal.profession;

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: true,
      body: SingleChildScrollView(

        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/Noel.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: (cities.length == 0) ? LoadingIndicator():buildMainContent(context),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.78,
                  left: MediaQuery.of(context).size.width * 0.43),
              child: FloatingActionButton(
                elevation: 6,
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  validateInputs();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildMainContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 120.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Form(
            key: formKey,
            autovalidate: _autoValidate,
            child: Container(
              width: double.infinity,
              height: 460,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 10.0),
                      blurRadius: 5),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'User Details',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Name',
                    ),
                    TextFormField(
                      cursorColor: Colors.teal,
                      autovalidate: _autoValidate,
                      validator: validateName,
                      keyboardType: TextInputType.text,
                      buildCounter: (BuildContext context,
                              {int currentLength,
                              int maxLength,
                              bool isFocused}) =>
                          null,
                      maxLength: 25,
                      controller: tecNameController,
                      focusNode: fnNameFocus,
                      onFieldSubmitted: (term) {
                        FocusScope.of(context)
                            .requestFocus(fnMobileFocus);
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Enter your Name',
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: 12.0),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Mobile',
                    ),
                    TextFormField(
                      cursorColor: Colors.teal,
                      autovalidate: _autoValidate,
                      validator: validateMobile,
                      controller: tecMobileController,
                      buildCounter: (BuildContext context,
                              {int currentLength,
                              int maxLength,
                              bool isFocused}) =>
                          null,
                      maxLength: 10,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.phone,
                      onFieldSubmitted: (term) {
                        FocusScope.of(context)
                            .requestFocus(fnCityFocus);
                      },
                      focusNode: fnMobileFocus,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Enter your Mobile Number',
                        hintStyle: TextStyle(
                            color: Colors.grey, fontSize: 12.0),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'City',
                    ),
                    SearchableDropdown<String>(
                      isExpanded: true,
                      items: cities
                          .map<DropdownMenuItem<String>>(
                              (data) => DropdownMenuItem<String>(
                                    child: new Text(data),
                                    value: data,
                                  ))
                          .toList(),
                      value: selectedCity,
                      hint: new Text('Select a City'),
                      searchHint: new Text(
                        'Select One',
                        style: new TextStyle(fontSize: 20),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                        });
                      },
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Profession',
                    ),
                    SearchableDropdown<String>(
                      isExpanded: true,
                      items: profession
                          .map<DropdownMenuItem<String>>(
                              (data) => DropdownMenuItem<String>(
                                    child: new Text(data),
                                    value: data,
                                  ))
                          .toList(),
                      value: selectedProfession,
                      hint: new Text('Select a Profession'),
                      searchHint: new Text(
                        'Select One',
                        style: new TextStyle(fontSize: 20),
                      ),
                      onChanged: (value) {
                        setState(() {
                          selectedProfession = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String validateName(String value) {
    if (value.isEmpty)
      return 'Name is required';
    else
      return null;
  }

  String validateMobile(String value) {
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must 10 digits";
    }
    return null;
  }

  void validateInputs() {
    final form = formKey.currentState;
    if (formKey.currentState.validate()) {
      RegistrationState.of(context).data.personal.name = tecNameController.text;
      RegistrationState.of(context).data.personal.mobile =
          tecMobileController.text;
      RegistrationState.of(context).data.personal.city = selectedCity;
      RegistrationState.of(context).data.personal.profession =
          selectedProfession;
      RegistrationState.of(context).currentPage++;
      RegistrationState.of(context).notify();
      form.save();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
