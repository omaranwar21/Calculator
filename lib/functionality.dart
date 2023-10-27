import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class Functionality {
  String display = "0";
  TextEditingController controller = TextEditingController(text: "0");
  String result = "0";
  String lastResult = "0";
  bool resultFlag = true;

  String calculate() {
    display = display.replaceAll('x', '*');
    display = operationHandeling(display);
    result = display.interpret().toStringAsFixed(5);
    lastResult = result;
    return result;
  }

  void updateText(String input) {
    if (resultFlag == false) {
      display = "0";
      resultFlag = true;
    }
    switch (input) {
      case "C":
        display = "0";
        break;
      case "=":
        display = calculate();
        resultFlag = false;
        result = display;
        break;
      case "DEL":
        if (display != "0") {
          display = display.substring(0, display.length - 1);
        }
        if (display.isEmpty) {
          display = "0";
        }
        break;
      case "ANS":
        display = lastResult;
        display = calculate();
        break;
      case "sin":
      case "cos":
      case "tan":
      case "√":
        if (display == "0") {
          display = "$input(";
        } else {
          display = "$display$input(";
        }
        break;
      default:
        if (display == "0") {
          display = input;
        } else {
          display += input;
        }
    }
    controller.text = display;
  }

  String operationHandeling(String operation) {
    operation = operation.replaceAll('√(', 'sqrt(');
    operation = operation.replaceAll('sin(', 'sin(pi/180*');
    operation = operation.replaceAll('cos(', 'cos(pi/180*');
    operation = operation.replaceAll('tan(', 'tan(pi/180*');

    return operation;
  }
}
