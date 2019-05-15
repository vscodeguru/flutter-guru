import 'package:flutter/material.dart';
import 'package:flutter_guru/newCode/screens/auth/Registration/widgets/personalWidget.dart';

class User extends StatefulWidget {
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  var searchview = TextEditingController();
  bool firstSearch = true;
  String query = '';
  List<String> cities;
  List<String> filterList;
  @override
  void initState() {
    super.initState();
    cities = new List<String>();
    cities = [
      'Salem',
      'Coimbatore',
      'Chennai',
      'Trichy',
      'Bangalore',
      'Kerala',
      'Kanyakumari',
      'Tirupur',
      'Jarkhand',
      'kozhikode',
      'Thiruvandram',
      'kozhikode'
    ];
    cities.sort();
  }

  filterSearchList() {
    searchview.addListener(() {
      if (searchview.text.isEmpty) {
        setState(() {
          firstSearch = true;
          query = '';
        });
      } else {
        setState(() {
          firstSearch = false;
          query = searchview.text;
        });
      }
    });
  }

  _onClear() {
    setState(() {
      searchview.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      // color: Colors.grey,
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 90),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Select your Cities',
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          createSearchview(),
          firstSearch  ? createListView() : performSearch(),
        ],
      ),
    ));
  }

  Widget createSearchview() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13),
      child: TextFormField(
        autofocus: true,
        controller: searchview,
        onSaved: filterSearchList(),
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15.0),
          hintText: 'Enter your cities',
          suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.teal,
              ),
              tooltip: 'Resend OTP',
              onPressed: () {
                _onClear();
              }),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal),
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              )),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal),
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }

  Widget createListView() {
    return new Flexible(
      child: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: new ListTile(
              leading: Icon(
                Icons.location_city,
              ),
              title: Text(
                '${cities[index]}',
              ),
            ),
          );
        },
      ),
    );
  }

  Widget performSearch() {
    filterList = List<String>();
    for (int i = 0; i < cities.length; i++) {
      var item = cities[i];
      if (item.toLowerCase().contains(query.toLowerCase())) {
        filterList.add(item);
      }
    }
    return createFilteredListView();
  }

  Widget createFilteredListView() {
    return new Flexible(
      child: ListView.builder(
        itemCount: filterList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: new ListTile(
              leading: Icon(
                Icons.location_city,
              ),
              title: RichText(
                text: TextSpan(
                  text: filterList[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: filterList[index].substring(query.length),
                        style: TextStyle(color: Colors.grey))
                  ],
                ),
              ),
              trailing: Icon(Icons.call_made),
            ),
          );
        },
      ),
    );
  }
}
