import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  Sample({Key key}) : super(key: key);

  _SampleState createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#466e7a'),
        centerTitle: true,
        title: Text('VEHICLE OWNED'),
        elevation: 0.1,
      ),
      backgroundColor: HexColor('#466e7a'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            //    color: HexColor('#2980b9'),
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'What type of Owner you are?',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 40, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new CardElm2('assets/car.png'),
                      new CardElm2('assets/motorcycle.png'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20, left: 55),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Car',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 45),
                        child: Text(
                          'Bike',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity, // match_parent
            child: FlatButton(
              color: Colors.teal,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              child: Text('Next'),
              textColor: Colors.white,
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

class CardElm2 extends StatefulWidget {
  String assetName='';
  CardElm2(String _assetName,{
    Key key, 
    
  }) : super(key: key){
    assetName = _assetName;
  }

  @override
  _CardElm2State createState() => _CardElm2State();
}

class _CardElm2State extends State<CardElm2> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.32,
        height: MediaQuery.of(context).size.height * 0.17,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: (isSelected)?Color(0xff7c94b6): Colors.white,
          image: DecorationImage(
            fit: BoxFit.scaleDown,
            image: ExactAssetImage(widget.assetName, scale: 2.5),
            colorFilter:
                (isSelected)?ColorFilter.mode(Color(0xff7c94b6), BlendMode.multiply):null,
          ),
        ),
        child: (isSelected)? Image(
          alignment: Alignment.bottomRight,
          image: NetworkImage('https://img.icons8.com/cotton/2x/checkmark.png',
              scale: 6),
        ):null,
      ),
    );
  }
}

class CardElem extends StatefulWidget {
  const CardElem({
    Key key,
  }) : super(key: key);

  @override
  _CardElemState createState() => _CardElemState();
}

class _CardElemState extends State<CardElem> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.32,
        height: MediaQuery.of(context).size.height * 0.17,
        decoration: BoxDecoration(
          //backgroundBlendMode: BlendMode.color,
          image: DecorationImage(
              alignment: Alignment.center,
              fit: BoxFit.none,
              //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2),BlendMode.overlay),
              image: ExactAssetImage('assets/car.png', scale: 2.5)),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        child: (isSelected)
            ? Image(
                alignment: Alignment.bottomRight,
                image: NetworkImage(
                    'https://img.icons8.com/cotton/2x/checkmark.png',
                    scale: 6),
              )
            : null,
      ),
    );
  }
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
