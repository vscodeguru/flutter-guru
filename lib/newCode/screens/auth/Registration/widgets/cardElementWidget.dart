import 'package:flutter/material.dart';
import 'package:flutter_guru/utils/theme/theme_guru.dart';

class CardElement extends StatefulWidget {
  String name = '';
  String assetName = '';
  ValueChanged<bool> onSelect;
  
  bool selected=false;
  CardElement(
    this.assetName,
    this.name, {
      this.selected,
    this.onSelect,
    Key key,
  }) : super(key: key);

  @override
  _CardElementState createState() => _CardElementState();
}

class _CardElementState extends State<CardElement> {



  bool isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
      this.isSelected = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        setState(() {
            isSelected = !isSelected;
            if (widget.onSelect != null) widget.onSelect(isSelected);
          },
        );
      },
      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.32,
            height: MediaQuery.of(context).size.height * 0.17,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              // #539298
              color: (isSelected)
                  ? Color(0xff539298)
                  : HexColor('#ffffff').withOpacity(0.80),
              image: DecorationImage(
                fit: BoxFit.scaleDown,
                image: ExactAssetImage(widget.assetName, scale: 2.5),
                colorFilter: (isSelected)
                    ? ColorFilter.mode(Color(0xff539298), BlendMode.multiply)
                    : null,
              ),
            ),
            child: (isSelected)
                ? Image(
                    alignment: Alignment.bottomRight,
                    image: ExactAssetImage(
                        'assets/checkmark.png',
                        scale: 6),
                  )
                : null,
          ),
          SizedBox(height: 10),
          Text(widget.name, style: TextStyle(color: Colors.white, fontSize: 20))
        ],
      ),
    );
  }
}