import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  TextEditingController celsiusController = TextEditingController(

  );

  TextEditingController fahrenheitController = TextEditingController(

  );

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields(){
    celsiusController.text = "";
    fahrenheitController.text = "";
  }

  void _converter(){
    double celsius = double.parse(celsiusController.text);
    double fahrenheit = celsius * 1.8 + 32.0;
    fahrenheitController.text = fahrenheit.toStringAsFixed(4);
  }

  @override
  Widget build(BuildContext context){
    AppBar appBar = AppBar(
      title: Text("Conversor de Temperatura"),
      centerTitle: true,
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: _resetFields,
        ),
      ],
    );

    Image imgLogo = Image.asset("assets/images/logo.png", height: 120, width: 120,);
    //Icon icon = Icon(Icons.wb_sunny, size: 120, color: Colors.yellow,);

    TextStyle styleDecoration = TextStyle(color: Colors.black, fontSize: 20);
    TextStyle styleField = TextStyle(color: Colors.blueAccent);

    RaisedButton raisedButton = RaisedButton(
      onPressed: (){
        if(_formKey.currentState.validate()){
          _converter();
        }
      },
      child: Text("calcular"),
      color: Colors.blueAccent,
    );

    Container containerBtn = Container(
      height: 200.0,
      child: raisedButton,
    );

    Padding padding = Padding(
        padding: EdgeInsets.only(top: 20.0),
      child: containerBtn,
    );

    TextFormField tempCelsius = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Temperatura em graus Celsius",
        labelStyle: styleDecoration,
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: celsiusController,
      validator: (value){
        if(value.isEmpty){
          return "Informe um valor";
        }
      },
    );

    TextFormField tempFahrenheit = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Temperatura em graus Fahrenheit",
        labelStyle: styleDecoration,
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: fahrenheitController,
      validator: (value){
        if(value.isEmpty){
          return "Informe um valor";
        }
      },
    );

    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //icon, tempCelsius, tempFahrenheit, padding,
        imgLogo, tempCelsius, tempFahrenheit, padding,

      ],
    );

    Form form = Form(
      child: column,
      key: _formKey,
    );

    SingleChildScrollView singleChildScrollView = SingleChildScrollView(
      child: form,
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
    );

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: singleChildScrollView,
    );

    return scaffold;
  }
}