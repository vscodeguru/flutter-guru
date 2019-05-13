import 'package:flutter/material.dart';
import 'package:flutter_guru/newCode/states/auth/registration.dart';
import 'package:flutter_guru/utils/theme/theme_guru.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        heroTag: null,
        elevation: 6,
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          RegistrationState.of(context).currentPage++;
          RegistrationState.of(context).notify();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
                // image: new DecorationImage(
                //   image: new AssetImage("assets/Noel.png"),
                //   fit: BoxFit.cover,
                // ),
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
                          color: Colors.teal,
                          // color: HexColor('#1a6d75').withOpacity(0.8),
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
                                height: 40,
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'Vehicle Details',
                                        style: TextStyle(fontSize: 20,color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
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
                    GestureDetector(
                      onTap: () {
                        RegistrationState.of(context).currentPage++;
                        RegistrationState.of(context).notify();
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/300_2.jpg'),
                          radius: MediaQuery.of(context).size.width * 0.07,
                        ),
                        trailing: Text(
                          '5:00 PM',
                        ),
                        title: new Text(
                          'Vaishnave',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Student',
                        ),
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
                      ),
                      title: new Text(
                        'Owasis',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Employee',
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
                      ),
                      title: new Text(
                        'Ralph Noel Bruno',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Software Develeloper',
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
                      ),
                      title: new Text(
                        'Prabakaran',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Developer',
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
                      ),
                      title: new Text(
                        'Nithya RamKrishnan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Human Resources',
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/300_2.jpg'),
                        radius: MediaQuery.of(context).size.width * 0.07,
                      ),
                      trailing: Text(
                        '1:00 PM',
                      ),
                      title: new Text(
                        'Priynaka',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Junior Developer',
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
