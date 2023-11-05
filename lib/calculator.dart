import 'package:flutter/material.dart';
import 'functionality.dart';

String input = "";
String result = "0";

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Map buttons = {
    "(": [0XFFED7D31, 0xFFF6F1EE],
    ")": [0XFFED7D31, 0xFFF6F1EE],
    "√": [0XFFED7D31, 0xFFF6F1EE],
    "e": [0XFFED7D31, 0xFFF6F1EE],
    "C": [0XFFED7D31, 0xFFF6F1EE],
    "DEL": [0XFFED7D31, 0xFFF6F1EE],
    "%": [0XFFED7D31, 0xFFF6F1EE],
    "/": [0XFFED7D31, 0xFFF6F1EE],
    "sin": [0XFFED7D31, 0xFFF6F1EE],
    "cos": [0XFFED7D31, 0xFFF6F1EE],
    "tan": [0XFFED7D31, 0xFFF6F1EE],
    "^": [0XFFED7D31, 0xFFF6F1EE],
    "9": [0xFFF6F1EE, 0xFF4F4A45],
    "8": [0xFFF6F1EE, 0xFF4F4A45],
    "7": [0xFFF6F1EE, 0xFF4F4A45],
    "+": [0XFFED7D31, 0xFFF6F1EE],
    "6": [0xFFF6F1EE, 0xFF4F4A45],
    "5": [0xFFF6F1EE, 0xFF4F4A45],
    "4": [0xFFF6F1EE, 0xFF4F4A45],
    "-": [0XFFED7D31, 0xFFF6F1EE],
    "3": [0xFFF6F1EE, 0xFF4F4A45],
    "2": [0xFFF6F1EE, 0xFF4F4A45],
    "1": [0xFFF6F1EE, 0xFF4F4A45],
    "x": [0XFFED7D31, 0xFFF6F1EE],
    "ANS": [0XFFED7D31, 0xFFF6F1EE],
    "0": [0xFFF6F1EE, 0xFF4F4A45],
    ".": [0XFFED7D31, 0xFFF6F1EE],
    "=": [0XFFED7D31, 0xFFF6F1EE]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF6c5f5b),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: TextField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(30),
                    fillColor: Color(0xFF4F4A45),
                    filled: true,
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                            BorderSide(color: Color(0xFFF6F1EE), width: 3))),
                textAlign: TextAlign.end,
                style: const TextStyle(
                    color: Color(0xFFF6F1EE),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
                controller: compute.controller,
                enabled: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                padding: const EdgeInsets.all(12),
                shrinkWrap: true,
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 10,
                  childAspectRatio: (MediaQuery.of(context).size.width * 0.2) /
                      (MediaQuery.of(context).size.height * 0.8 / 9.0),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ButtonInterfacing(
                      buttonText: buttons.keys.elementAt(index),
                      buttonColor: buttons.values.elementAt(index)[0],
                      buttonTextColor: buttons.values.elementAt(index)[1]);
                },
              ),
            ),
          ],
        ));
  }
}

Functionality compute = Functionality();

class ButtonInterfacing extends StatefulWidget {
  const ButtonInterfacing(
      {super.key,
      required this.buttonText,
      required this.buttonColor,
      required this.buttonTextColor});

  final String buttonText;
  final int buttonColor;
  final int buttonTextColor;

  @override
  State<ButtonInterfacing> createState() => _ButtonInterfacingState();
}

class _ButtonInterfacingState extends State<ButtonInterfacing> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 2,
          backgroundColor: Color(widget.buttonColor),
          foregroundColor: Color(widget.buttonTextColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          textStyle: const TextStyle(fontSize: 25)),
      onPressed: () {
        setState(() => compute.updateText(widget.buttonText));
      },
      child: FittedBox(child: Text(widget.buttonText)),
    );
  }
}