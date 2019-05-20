import 'package:flutter/material.dart';

class Profession extends StatefulWidget {
  final List<String> profession;

  Profession({this.profession});
  _ProfessionState createState() => _ProfessionState();
}

class _ProfessionState extends State<Profession> {
  var searchview = TextEditingController();
  bool firstSearch = true;
  String query = '';
  List<String> profession;
  List<String> filter;
  @override
  void initState() {
    super.initState();
    profession = widget.profession;
    profession.sort();
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
                'Choose your profession',
                style: TextStyle(fontSize: 30),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          createSearchview(),
          firstSearch ? createListView() : performSearch(),
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
          hintText: 'Select your profession',
          suffixIcon: IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.teal,
              ),
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
        itemCount: profession.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context, profession[index]);
            },
            child: new ListTile(
              leading: Icon(
                Icons.person_pin,
              ),
              title: Text(
                '${profession[index]}',
              ),
            ),
          );
        },
      ),
    );
  }

  Widget performSearch() {
    filter = List<String>();
    for (int i = 0; i < profession.length; i++) {
      var item = profession[i];
      if (item.toLowerCase().contains(query.toLowerCase())) {
        filter.add(item);
      }
    }
    return createFilteredListView();
  }

  Widget createFilteredListView() {
    return new Flexible(
      child: ListView.builder(
        itemCount: filter.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context, filter[index]);
            },
            child: new ListTile(
              leading: Icon(
                Icons.person_pin,
              ),
              title: RichText(
                text: TextSpan(
                  text: filter[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: filter[index].substring(query.length),
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
