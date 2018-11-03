import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Vargatt',
    home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _InfoText = "";

  void changePeople(int delta){
    setState(() {
      _people += delta;
      _people <= 0 ? _people = 0 : 1;
      if(_people > 5){
        _InfoText = "Fechado";
      }else{
        _InfoText = "Aberto";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/back.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas: $_people ",
              style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                FlatButton(
                  child: Text(
                    "Inc",
                    style: TextStyle(fontSize: 40.0, color: Colors.black38),
                  ),
                  onPressed: (){
                    changePeople(1);
                  },
                ),
                FlatButton(
                  child: Text(
                    "Dec",
                    style: TextStyle(fontSize: 40.0, color: Colors.black38),
                  ),
                  onPressed: (){
                    changePeople(-1);
                  },
                ),
              ],
            ),
            Text(
              _InfoText,
              style: TextStyle(
                  color: Colors.black38, fontWeight: FontWeight.bold),
            )
          ],
        )
      ],
    );
  }
}
