import 'dart:math';
import 'package:flutter/cupertino.dart';

class CalculatorBrain {
  int height;
  int weight;
  double _bmi;

  CalculatorBrain({@required this.height, @required this.weight});

  String bmiCalc() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return 'OverWeight';
    } else if (_bmi > 18.5) {
      return 'normal';
    } else {
      return 'underWeight';
    }
  }

  String getInterpretation() {
    if (_bmi > 25) {
      return 'You should eat less ';
    } else if (_bmi > 18.5) {
      return 'No need to worry';
    } else {
      return 'You need to eat more food';
    }
  }

}
