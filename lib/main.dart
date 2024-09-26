import 'package:calculator/screens/calculator_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: CalculatorScreen.routeName,
      routes: {
        CalculatorScreen.routeName: (_) => const CalculatorScreen(),
      },
    );
  }
}
