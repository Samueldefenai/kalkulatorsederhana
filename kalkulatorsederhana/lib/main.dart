import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = "0";
  double num1 = 0;
  double num2 = 0;
  String operator = "";
  bool shouldClear = false;

  void buttonPressed(String buttonText) {
    if (buttonText == "C") {
      display = "0";
      num1 = 0;
      num2 = 0;
      operator = "";
      shouldClear = false;
    } else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/") {
      num1 = double.parse(display);
      operator = buttonText;
      shouldClear = true;
    } else if (buttonText == "=") {
      num2 = double.parse(display);
      if (operator == "+") {
        display = (num1 + num2).toString();
      } else if (operator == "-") {
        display = (num1 - num2).toString();
      } else if (operator == "x") {
        display = (num1 * num2).toString();
      } else if (operator == "/") {
        if (num2 != 0) {
          display = (num1 / num2).toString();
        } else {
          display = "Error";
        }
      }
      operator = "";
      shouldClear = true;
    } else {
      if (shouldClear) {
        display = buttonText;
        shouldClear = false;
      } else {
        display = display == "0" ? buttonText : display + buttonText;
      }
    }

    setState(() {});
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(24.0)),
        ),
        onPressed: () {
          buttonPressed(buttonText);
        },
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalkulator Sederhana'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            child: Text(
              display,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: <Widget>[
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("x"),
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: [
                  buildButton("C"),
                  buildButton("0"),
                  buildButton("="),
                  buildButton("+"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}