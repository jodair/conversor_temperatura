import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context){
    AppBar appBar = AppBar(
      title: Text("Conversor de Temperatura"),
      centerTitle: true,
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: () {},
        ),
      ],
    );

    Icon icon = Icon(Icons.wb_sunny, size: 120, color: Colors.yellow,);

    TextStyle styleDecoration = TextStyle(color: Colors.black, fontSize: 20);
    TextStyle styleField = TextStyle(color: Colors.blueAccent);

    RaisedButton raisedButton = RaisedButton(
      onPressed: (){},
      child: Text("calcular"),
      color: Colors.blueAccent,
    );

    Container containerBtn = Container(
      height: 50.0,
      child: raisedButton,
    );

    TextField tempCelsius = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Temperatura em graus Celsius",
        labelStyle: styleDecoration,
      ),
      textAlign: TextAlign.center,
      style: styleField,
    );

    TextField tempFahrenheit = TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Temperatura em graus Fahrenheit",
        labelStyle: styleDecoration,
      ),
      textAlign: TextAlign.center,
      style: styleField,
    );

    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        icon, tempCelsius, tempFahrenheit, containerBtn,

      ],
    );

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: column,
    );

    return scaffold;
  }
}