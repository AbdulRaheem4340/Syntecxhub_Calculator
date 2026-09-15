import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String input = '';
  String result = '';
  bool isResult = false;

  void onButtonPressed(String value) {
    setState(() {
      input += value;
    });
  }

  void onCalculate() {
    try {
      String finalInput = input.replaceAll('×', '*').replaceAll('÷', '/');
      Parser p = Parser();
      Expression exp = p.parse(finalInput);
      ContextModel cm = ContextModel();
      result = exp.evaluate(EvaluationType.REAL, cm).toString();
      isResult = true;
    } catch (e) {
      result = 'Error';
      isResult = true;
    }

    setState(() {});
  }

  void onClear() {
    setState(() {
      input = '';
      result = '';
      isResult = false;
    });
  }

  void onValueReduce() {
    setState(() {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(input, style: TextStyle(fontSize: 32)),
            isResult
                ? Text('Result: $result', style: TextStyle(fontSize: 30))
                : Text('Result: 0', style: TextStyle(fontSize: 30)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => onButtonPressed('7'),
                  child: Text(
                    '7',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed('8'),
                  child: Text(
                    '8',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed('9'),
                  child: Text(
                    '9',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed('÷'),
                  child: Text(
                    '÷',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => onButtonPressed('4'),
                  child: Text(
                    '4',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed('5'),
                  child: Text(
                    '5',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed('6'),
                  child: Text(
                    '6',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed('×'),
                  child: Text(
                    '×',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => onButtonPressed('1'),
                  child: Text(
                    '1',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed('2'),
                  child: Text(
                    '2',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed('3'),
                  child: Text(
                    '3',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed('-'),
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: onClear,
                  child: Text(
                    'C',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed('0'),
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: onCalculate,
                  child: Text(
                    '=',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => onButtonPressed('+'),
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 28, color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
