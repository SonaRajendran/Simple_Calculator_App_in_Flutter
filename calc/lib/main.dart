import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _output = "";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "";
      } else if (buttonText == "=") {
        num2 = double.tryParse(_output) ?? 0;
        if (operand == "+") {
          _output = (num1 + num2).toString();
        } else if (operand == "-") {
          _output = (num1 - num2).toString();
        } else if (operand == "*") {
          _output = (num1 * num2).toString();
        } else if (operand == "/") {
          _output = (num1 / num2).toString();
        }
        operand = "";
      } else {
        if (buttonText == "+" ||
            buttonText == "-" ||
            buttonText == "*" ||
            buttonText == "/") {
          num1 = double.tryParse(_output) ?? 0;
          operand = buttonText;
          _output = "";
        } else {
          _output += buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonText),
          child: Text(buttonText, style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            alignment: Alignment.centerRight,
            child: Text(_output, style: TextStyle(fontSize: 48)),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/")
                ],
              ),
              Row(
                children: [
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*")
                ],
              ),
              Row(
                children: [
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-")
                ],
              ),
              Row(
                children: [
                  buildButton("C"),
                  buildButton("0"),
                  buildButton("="),
                  buildButton("+")
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
