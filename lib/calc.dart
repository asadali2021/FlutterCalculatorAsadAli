import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";
  Widget btn(var btext) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () {
        setState(() {
          result = result + btext;
        });
      },
      child: Text(
        btext,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
        ),
      ),
    );
  }

  clear() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result,
              style: TextStyle(
                  color: Colors.cyan[900],
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn("1"),
                  btn("2"),
                  btn("3"),
                  btn("4"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn("5"),
                  btn("6"),
                  btn("7"),
                  btn("8"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn("9"),
                  btn("0"),
                  btn("+"),
                  btn("-"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btn("*"),
                  btn("/"),
                  FloatingActionButton(
                    backgroundColor: Colors.amber,
                    onPressed: clear,
                    child: Text(
                      "C",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.green,
                    onPressed: output,
                    child: Text(
                      "=",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
