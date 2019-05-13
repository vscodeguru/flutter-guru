import 'package:flutter/material.dart';
import 'package:flutter_guru/newCode/states/auth/registration.dart';
import 'package:flutter_guru/utils/theme/theme_guru.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("assets/Noel.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  //    color: HexColor('#2980b9'),
                  //  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 80,
                        decoration: new BoxDecoration(
                          color: HexColor('#1a6d75').withOpacity(0.8),
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
                                height: 28,
                              ),
                              Row(
                                //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                    padding: EdgeInsets.all(0.0),
                                    onPressed: () {
                                      RegistrationState.of(context)
                                          .currentPage--;
                                      RegistrationState.of(context).notify();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        ' Details',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 40,
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
              ],
            ),
          ),
          Positioned.fill(
            // left: MediaQuery.of(context).size.width * 0.05,
            // top: MediaQuery.of(context).size.height * 0.43,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/300_2.jpg'),
                        radius: MediaQuery.of(context).size.width * 0.07,
                      ),
                      trailing: Text(
                        '5:00 PM',
                        style: TextStyle(color: Colors.white),
                      ),
                      title: new Text(
                        'Vaishnave',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Text(
                        'Student',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/300_1.jpg'),
                        radius: MediaQuery.of(context).size.width * 0.07,
                      ),
                      trailing: Text(
                        '2:00 AM',
                        style: TextStyle(color: Colors.white),
                      ),
                      title: new Text(
                        'Owasis',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Text(
                        'Employee',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/100_13.jpg'),
                        radius: MediaQuery.of(context).size.width * 0.07,
                      ),
                      trailing: Text(
                        '5:30 AM',
                        style: TextStyle(color: Colors.white),
                      ),
                      title: new Text(
                        'Ralph Noel Bruno',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Text(
                        'Software Develeloper',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/300_3.jpg'),
                        radius: MediaQuery.of(context).size.width * 0.07,
                      ),
                      trailing: Text(
                        '8:30 PM',
                        style: TextStyle(color: Colors.white),
                      ),
                      title: new Text(
                        'Prabakaran',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Text(
                        'Developer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/300_11.jpg'),
                        radius: MediaQuery.of(context).size.width * 0.07,
                      ),
                      trailing: Text(
                        '5:00 PM',
                        style: TextStyle(color: Colors.white),
                      ),
                      title: new Text(
                        'Nithya RamKrishnan',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Text(
                        'Human Resources',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/300_2.jpg'),
                        radius: MediaQuery.of(context).size.width * 0.07,
                      ),
                      trailing: Text('1:00 PM',
                          style: TextStyle(color: Colors.white)),
                      title: new Text(
                        'Priynaka',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      subtitle: Text(
                        'Junior Developer',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
