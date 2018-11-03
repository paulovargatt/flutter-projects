import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String infoText = '';

  void resetFields() {
    weightController.text = '';
    heightController.text = '';
    setState(() {
      infoText = '';
    });
  }

  void calculate() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100;
      double imc = weight / (height * height);
      print(imc);
      if (imc < 18.6) {
        infoText = "Abaixo do Peso ${imc.toStringAsPrecision(4)}";
      }
      else if (imc >= 18.6 && imc < 24.9) {
        infoText = "Peso Ideal ${imc.toStringAsPrecision(4)}";
      }
      else if (imc >= 24.9 && imc < 29.9) {
        infoText =
        "Levemente acima do Peso Ideal ${imc.toStringAsPrecision(4)}";
      }
      else if (imc >= 29.9 && imc < 34.9) {
        infoText = "Acima do Peso ${imc.toStringAsPrecision(4)}";
      } else {
        infoText = "GORDO PRA CARALHO ${imc.toStringAsPrecision(4)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(

            icon: Icon(Icons.refresh),
            onPressed: resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            Icon(
            Icons.person,
            size: 200.0,
            color: Colors.blueAccent,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Peso",
                labelStyle: TextStyle(color: Colors.green)),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 20.0),
            controller: weightController,
            validator: (value) {
              if (value.isEmpty) {
                return "Insira sua Altura";
              }
            },
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: "Altura",
                labelStyle: TextStyle(color: Colors.green)),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 20.0),
            controller: heightController,
            validator: (value) {
              if (value.isEmpty) {
                return "Insira seu peso";
              }
            },
          ),
          Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Container(
                height: 50.0,
                child: RaisedButton(
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      calculate();
                    }
                  },
                  child: Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white, fontSize: 23.0),
                ),
                color: Colors.green,
              )),
        ),
        Text(
          infoText,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontSize: 30.0),
        )
        ],
      ),)));
  }
}}
