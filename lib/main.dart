import 'package:bmi_calculator_app/Ui/THEME.dart';
import 'package:bmi_calculator_app/Ui/bmi_calculator.dart';
import 'package:bmi_calculator_app/Util/colors.dart';
import 'package:flutter/material.dart';

final theme = BMITheme.bmi();


void main() {
  runApp( MaterialApp(
    theme: theme,
    home: const BmiApp(),
  ));
}

