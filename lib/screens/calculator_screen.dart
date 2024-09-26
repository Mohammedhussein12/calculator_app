import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  static const String routeName = '/calculatorScreen';

  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resultText = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            'Calculator',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.centerLeft,
                child: Text(
                  resultText,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(
                    text: '√',
                    onPressed: squareRoot,
                  ),
                  CalculatorButton(
                    text: 'x²',
                    onPressed: squareOf,
                  ),
                  CalculatorButton(
                    text: 'C',
                    onPressed: clear,
                  ),
                  CalculatorButton(
                    text: '⌫',
                    onPressed: backSpace,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(
                    text: '7',
                    onPressed: onDigitClicked,
                  ),
                  CalculatorButton(
                    text: '8',
                    onPressed: onDigitClicked,
                  ),
                  CalculatorButton(
                    text: '9',
                    onPressed: onDigitClicked,
                  ),
                  CalculatorButton(
                    text: '*',
                    onPressed: onOperatorClicked,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(
                    text: '4',
                    onPressed: onDigitClicked,
                  ),
                  CalculatorButton(
                    text: '5',
                    onPressed: onDigitClicked,
                  ),
                  CalculatorButton(
                    text: '6',
                    onPressed: onDigitClicked,
                  ),
                  CalculatorButton(
                    text: '/',
                    onPressed: onOperatorClicked,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(
                    text: '1',
                    onPressed: onDigitClicked,
                  ),
                  CalculatorButton(
                    text: '2',
                    onPressed: onDigitClicked,
                  ),
                  CalculatorButton(
                    text: '3',
                    onPressed: onDigitClicked,
                  ),
                  CalculatorButton(
                    text: '+',
                    onPressed: onOperatorClicked,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculatorButton(
                    text: '.',
                    onPressed: onDotClicked,
                  ),
                  CalculatorButton(
                    text: '0',
                    onPressed: onDigitClicked,
                  ),
                  CalculatorButton(
                    text: '=',
                    onPressed: onEqualClicked,
                  ),
                  CalculatorButton(
                    text: '-',
                    onPressed: onOperatorClicked,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String savedNumber = '';
  String savedOperator = '';

  clear(String _) {
    resultText = '';
    setState(() {});
  }

  squareOf(String _) {
    if (resultText.isEmpty) return;
    resultText = pow(double.parse(resultText), 2).toString();
    setState(() {});
  }

  backSpace(String _) {
    if (resultText.isEmpty) return;
    String x = resultText;
    List<String> list = x.split("");
    list.removeLast();
    resultText = list.join();
    setState(() {});
  }

  onDigitClicked(String clickedDigit) {
    resultText += clickedDigit;
    setState(() {});
  }

  onOperatorClicked(String clickedOperator) {
    if (resultText.isEmpty) return;
    if (savedOperator.isEmpty) {
      savedNumber = resultText;
    } else if (savedOperator.isNotEmpty) {
      savedNumber = calculate(savedNumber, savedOperator, resultText);
    }
    savedOperator = clickedOperator;
    resultText = '';
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    double number1 = double.parse(lhs);
    double number2 = double.parse(rhs);
    double result = 0;
    switch (operator) {
      case '+':
        result = number1 + number2;
        break;
      case '-':
        result = number1 - number2;
        break;
      case '*':
        result = number1 * number2;
        break;
      case '/':
        result = number1 / number2;
        break;
    }
    return result.toString();
  }

  squareRoot(String _) {
    if (resultText.isEmpty) {
      return;
    }
    resultText = sqrt(double.parse(resultText)).toString();
    setState(() {});
  }

  onEqualClicked(String _) {
    if (resultText.isEmpty || savedNumber.isEmpty) {
      return;
    }
    resultText = calculate(savedNumber, savedOperator, resultText);
    savedNumber = '';
    savedOperator = '';
    setState(() {});
  }

  onDotClicked(String _) {
    if (resultText.contains('.')) return;
    resultText += '.';
    setState(() {});
  }
}
