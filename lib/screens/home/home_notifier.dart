import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:math_expressions/math_expressions.dart';

final homeProvider = ChangeNotifierProvider<HomeNotifier>((ref) {
  return HomeNotifier();
});

class HomeNotifier extends ChangeNotifier {
  double total = 0;
  bool totalZero = false;
  String value = "";
  String screenValue = "";

  void setScreenValue(String valueScreen) {
    if (total != 0) {
      total = 0;
      screenValue = "";
    }
    screenValue = screenValue + valueScreen;
    value = valueScreen;

    notifyListeners();
  }

  void clear() {
    value = "";
    screenValue = "";
    totalZero = false;
    total = 0;
    notifyListeners();
  }

  void sum() {
    if (value != "") {
      if (total != 0) {
        screenValue = total.toString() + "+";
        total = 0;
      } else {
        screenValue = screenValue + "+";
        value = "";
      }
      totalZero = false;
      notifyListeners();
    }
  }

  void substraction() {
    if (value != "") {
      if (total != 0) {
        screenValue = total.toString() + "-";
        total = 0;
      } else {
        screenValue = screenValue + "-";
        value = "";
      }
      totalZero = false;
      notifyListeners();
    }
  }

  void multiplication() {
    if (value != "") {
      if (total != 0) {
        screenValue = total.toString() + "*";
        total = 0;
      } else {
        screenValue = screenValue + "*";
        value = "";
      }
      totalZero = false;
      notifyListeners();
    }
  }

  void division() {
    if (value != "") {
      if (total != 0) {
        screenValue = total.toString() + "/";
        total = 0;
      } else {
        screenValue = screenValue + "/";
        value = "";
      }
      totalZero = false;
      notifyListeners();
    }
  }

  void percent() {
    if (value != "") {
      if (total != 0) {
        screenValue = total.toString() + "%";
        total = 0;
      } else {
        screenValue = screenValue + "%";
        value = "";
      }
      totalZero = false;
      notifyListeners();
    }
  }

  void calculate() {
    try {
      totalZero = false;
      String lastString = screenValue[screenValue.length - 1];

      if (lastString == "+" ||
          lastString == '-' ||
          lastString == "*" ||
          lastString == "/") {
        screenValue = screenValue.substring(0, (screenValue.length - 1));
      }

      Parser p = Parser();
      Expression exp = p.parse(screenValue);

      // Contexto es necesario para evaluar la expresión.
      ContextModel cm = ContextModel();

      total = exp.evaluate(EvaluationType.REAL, cm);
      if (total == 0) {
        totalZero = true;
      }

      notifyListeners();
    } catch (e) {
      screenValue = "Error";
    }
  }
}
