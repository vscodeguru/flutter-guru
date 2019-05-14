import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  Report({Key key}) : super(key: key);

  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      //   centerTitle: true,
      //   title: Text('Report'),
      //   elevation: 0.0,
      // ),
      body: new Stack(
        children: <Widget>[
          _buildClipPath(),
          Positioned(
            //  width: 300.0,
            right: 45,
            top: MediaQuery.of(context).size.height * 0.38,
            child: Column(
              children: <Widget>[
                Container(
                  child: FloatingActionButton(
                    elevation: 5,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.add),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          _buildTopPositioned(context),
          _buildBottomPositioned(context),
        ],
      ),
    );
  }

  Positioned _buildBottomPositioned(BuildContext context) {
    return Positioned.fill(
      left: MediaQuery.of(context).size.width * 0.05,
      top: MediaQuery.of(context).size.height * 0.43,
      child: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.pinkAccent,
                ),
                trailing: Text('5:00 PM'),
                title: new Text(
                  'Profile Report',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('User can view the profile'),
              ),
              ListTile(
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.blueAccent,
                ),
                trailing: Text('2:00 AM'),
                title: new Text(
                  'User',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('User can view the profile'),
              ),
              ListTile(
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.greenAccent,
                ),
                trailing: Text('5:30 AM'),
                title: new Text(
                  'Accounts',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('User can view the profile'),
              ),
              ListTile(
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.purpleAccent,
                ),
                trailing: Text('8:30 PM'),
                title: new Text(
                  'Card',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('User can view the profile'),
              ),
              ListTile(
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.pinkAccent,
                ),
                trailing: Text('5:00 PM'),
                title: new Text(
                  'Profile',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('User can view the profile'),
              ),
              ListTile(
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.orangeAccent,
                ),
                trailing: Text('1:00 PM'),
                title: new Text(
                  'Cash',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('User can view the profile'),
              ),
              ListTile(
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.indigo,
                ),
                trailing: Text('1:00 PM'),
                title: new Text(
                  'Card',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('User can view the profile'),
              ),
              ListTile(
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.teal,
                ),
                trailing: Text('1:00 PM'),
                title: new Text(
                  'Bank',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('User can view the profile'),
              ),
              ListTile(
                leading: Icon(
                  Icons.fiber_manual_record,
                  color: Colors.teal,
                ),
                trailing: Text('1:00 PM'),
                title: new Text(
                  'Account Balance',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('User can view the profile'),
              )
            ],
          ),
        ],
      ),
    );
  }

  Positioned _buildTopPositioned(BuildContext context) {
    return Positioned(
      top: 100,
      left: 30,
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/100_14.jpg'),
            radius: MediaQuery.of(context).size.width * 0.10,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'Flutter Guru',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  ClipPath _buildClipPath() {
    return ClipPath(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/cmp.jpg'),
          ),
        ),
      ),
      clipper: GetClipper(),
    );
  }
}

class GetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height * 0.3);
    path.lineTo(size.width, size.height * 0.45);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
