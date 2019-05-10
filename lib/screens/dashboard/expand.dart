import 'package:flutter/material.dart';

class Expand extends StatefulWidget {
  Expand({Key key}) : super(key: key);

  _ExpandState createState() => _ExpandState();
}

class _ExpandState extends State<Expand> {
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
            ),
            //  Expanded(child: Container()),
          ],
        ),
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, 15.0),
                            blurRadius: 25.0),
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0.0, -10.0),
                            blurRadius: 25.0),
                      ]),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
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
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your Name',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Mobile',
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your Mobile Number',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'City',
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your city',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Profession',
                        ),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your Profession',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RaisedButton(
                      splashColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Text('Next'),
                      color: Colors.teal,
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          print('ralph');
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Text('Next'),
                      color: Colors.teal,
                      textColor: Colors.white,
                      onPressed: () {
                        setState(() {
                          print('ralph');
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    )

        // body: Container(
        //   child: Stack(
        //     children: <Widget>[
        //       Container(
        //         child: SingleChildScrollView(
        //             child: Container(
        //           height: MediaQuery.of(context).size.height,
        //           padding: EdgeInsets.all(16),
        //           child: Column(
        //             mainAxisSize: MainAxisSize.max,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: <Widget>[
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 children: <Widget>[
        //                   Text(
        //                     'User Details',
        //                     style: TextStyle(fontSize: 30),
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(
        //                 height: 10,
        //               ),
        //               Divider(
        //                 height: 16,
        //                 color: Colors.grey,
        //               ),
        //               SizedBox(
        //                 height: 20,
        //               ),
        //               TextFormField(
        //                 decoration: InputDecoration(
        //                   contentPadding: const EdgeInsets.all(13.0),
        //                   labelText: 'Name',
        //                   hintText: 'Enter your Name',
        //                   suffixIcon: Icon(
        //                     Icons.person,
        //                   ),
        //                   border: OutlineInputBorder(
        //                     borderRadius: BorderRadius.all(
        //                       Radius.circular(5.0),
        //                     ),
        //                   ),
        //                   focusedBorder: OutlineInputBorder(
        //                     borderRadius: BorderRadius.all(
        //                       Radius.circular(5.0),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               SizedBox(height: 20.0),
        //               TextFormField(
        //                 keyboardType: TextInputType.phone,
        //                 maxLength: 10,
        //                 buildCounter: (BuildContext context,
        //                         {int currentLength,
        //                         int maxLength,
        //                         bool isFocused}) =>
        //                     null,
        //                 inputFormatters: [
        //                   WhitelistingTextInputFormatter.digitsOnly,
        //                 ],
        //                 decoration: InputDecoration(
        //                   contentPadding: const EdgeInsets.all(13.0),
        //                   labelText: 'Mobile',
        //                   hintText: 'Enter your Mobile',
        //                   suffixIcon: Icon(
        //                     Icons.phone_android,
        //                   ),
        //                   border: OutlineInputBorder(
        //                     borderRadius: BorderRadius.all(
        //                       Radius.circular(5.0),
        //                     ),
        //                   ),
        //                   focusedBorder: OutlineInputBorder(
        //                     borderRadius: BorderRadius.all(
        //                       Radius.circular(5.0),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               SizedBox(height: 20.0),
        //               TextFormField(
        //                 decoration: InputDecoration(
        //                   contentPadding: const EdgeInsets.all(13.0),
        //                   labelText: 'City',
        //                   hintText: 'Enter your City',
        //                   suffixIcon: Icon(
        //                     Icons.domain,
        //                   ),
        //                   border: OutlineInputBorder(
        //                     borderRadius: BorderRadius.all(
        //                       Radius.circular(5.0),
        //                     ),
        //                   ),
        //                   focusedBorder: OutlineInputBorder(
        //                     borderRadius: BorderRadius.all(
        //                       Radius.circular(5.0),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               SizedBox(height: 20.0),
        //               TextFormField(
        //                 decoration: InputDecoration(
        //                   contentPadding: const EdgeInsets.all(13.0),
        //                   labelText:'Profession',
        //                   hintText: 'Enter your Profession',
        //                   suffixIcon: Icon(
        //                     Icons.business,
        //                   ),
        //                   border: OutlineInputBorder(
        //                     borderRadius: BorderRadius.all(
        //                       Radius.circular(5.0),
        //                     ),
        //                   ),
        //                   focusedBorder: OutlineInputBorder(
        //                     borderRadius: BorderRadius.all(
        //                       Radius.circular(5.0),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               SizedBox(height: 20.0),
        //               TextFormField(
        //                 decoration: InputDecoration(
        //                   contentPadding: const EdgeInsets.all(13.0),
        //                   labelText: 'Appointment Date & Time',
        //                   hintText: 'Appointment Date & Time',
        //                   suffixIcon: Icon(
        //                     Icons.business,
        //                   ),
        //                   border: OutlineInputBorder(
        //                     borderRadius: BorderRadius.all(
        //                       Radius.circular(5.0),
        //                     ),
        //                   ),
        //                   focusedBorder: OutlineInputBorder(
        //                     borderRadius: BorderRadius.all(
        //                       Radius.circular(5.0),
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //               SizedBox(height: 20.0),
        //               Container(
        //                 child: Row(
        //                   children: <Widget>[
        //                     Text(
        //                       'Other Details',
        //                       style: TextStyle(fontSize: 30),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //               SizedBox(height: 5.0),
        //               Divider(
        //                 height: 16,
        //                 color: Colors.grey,
        //               ),
        //               SizedBox(height: 5.0),
        //               Container(
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                   children: <Widget>[
        //                     Text('Purpose'),
        //                     Row(
        //                       children: <Widget>[
        //                         Radio(
        //                             value: 0,
        //                             groupValue: purposeValue,
        //                             onChanged: (a) {
        //                               setState(() {
        //                                 purposeValue = 0;
        //                               });
        //                             }),
        //                         Text('Investment'),
        //                       ],
        //                     ),
        //                     Row(
        //                       children: <Widget>[
        //                         Radio(
        //                             value: 1,
        //                             groupValue: purposeValue,
        //                             onChanged: (a) {
        //                               setState(() {
        //                                 purposeValue = 1;
        //                               });
        //                             }),
        //                         new Text('Savings'),
        //                       ],
        //                     ),
        //                     Row(
        //                       children: <Widget>[
        //                         Radio(
        //                             value: 2,
        //                             groupValue: purposeValue,
        //                             onChanged: (a) {
        //                               setState(() {
        //                                 purposeValue = 2;
        //                               });
        //                             }),
        //                         new Text('others'),
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               Container(
        //                 padding: EdgeInsets.only(right: 50),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                   children: <Widget>[
        //                     Text('Home'),
        //                     Row(
        //                       children: <Widget>[
        //                         Radio(
        //                             value: 0,
        //                             groupValue: homeValue,
        //                             onChanged: (a) {
        //                               setState(() {
        //                                 homeValue = 0;
        //                               });
        //                             }),
        //                         Text('Own house'),
        //                       ],
        //                     ),
        //                     Row(
        //                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                       children: <Widget>[
        //                         Radio(
        //                             value: 1,
        //                             groupValue: homeValue,
        //                             onChanged: (a) {
        //                               setState(() {
        //                                 homeValue = 1;
        //                               });
        //                             }),
        //                         new Text('Rent house'),
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               Container(
        //                 padding: EdgeInsets.only(right: 150),
        //                 child: Row(
        //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                   children: <Widget>[
        //                     Text('Vehicle '),
        //                     Row(
        //                       children: <Widget>[
        //                         Checkbox(
        //                             value: isChecked,
        //                             onChanged: (value) {
        //                               setState(() {
        //                                 isChecked = value;
        //                               });
        //                             }),
        //                         Text('Car'),
        //                       ],
        //                     ),
        //                     Row(
        //                       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                       children: <Widget>[
        //                         Checkbox(
        //                             value: check,
        //                             onChanged: (value) {
        //                               setState(() {
        //                                 check = value;
        //                               });
        //                             }),
        //                         new Text('Bike'),
        //                       ],
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               SizedBox(height: 10.0),
        //               Container(
        //                 width: MediaQuery.of(context).size.width,
        //                 child: RaisedButton(
        //                   shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(20.0),
        //                   ),
        //                   splashColor: Colors.blueGrey,
        //                   elevation: 10,
        //                   color: Colors.blue,
        //                   textColor: Colors.white,
        //                   onPressed: () {
        //                     print('tapped');
        //                     Navigator.of(context).pushNamed("/sample");
        //                   },
        //                   child: Text('Next'),
        //                 ),
        //               )
        //             ],
        //           ),
        //         )),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
