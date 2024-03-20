import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: "Numero de jogadores de futebol", home: Home())); //Material App
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _mensagem = "Faltam jogadores!";

  void _changePeople(int delta) {
    setState(() {
      _pessoa += delta;
      if (_pessoa >= 11) {
        _mensagem = "Time completo!";
        _pessoa = 11;
      } else if (_pessoa < 11 && _pessoa >= 0) {
        _mensagem = "Ainda Faltam jogadores!";
      } else {
        _pessoa = 0;
      }
    });
  }

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          //
          child: Image(
            image: AssetImage('img/fut3.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Jogadores: $_pessoa",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ), //text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: Text(
                      "+1",
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Color.fromARGB(255, 12, 219, 12)),
                    ),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    child: Text(
                      "-1",
                      style: TextStyle(
                          fontSize: 40.0,
                          color: Color.fromARGB(255, 223, 52, 9)),
                    ),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _mensagem,
              style: TextStyle(
                  color: Color.fromARGB(255, 245, 245, 245),
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
            ) //text
          ], //widget
        ) //Column
      ],
    );
  }
}
