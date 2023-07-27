import 'package:bmi_calculator_app/Util/colors.dart';
import 'package:flutter/material.dart';


class BMITheme{
  static TextTheme lightTextTheme = const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 32.0,
      color: Colors.white,
      fontWeight: FontWeight.bold
    ),
    displayLarge: TextStyle(
      fontSize: 38.0,
      fontWeight: FontWeight.bold,
      color: Colors.white
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 23.0,
      fontWeight: FontWeight.w700
    ),
    displaySmall: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w700,
        color: Colors.white
    ),
    headlineMedium: TextStyle(
      fontSize: 18.0,
      color: Colors.grey,
      fontWeight: FontWeight.w700
    ),
    headlineSmall: TextStyle(
      fontSize: 16.0,
      color: Colors.grey,
      fontWeight: FontWeight.w700
    ),
  ).apply(
    fontFamily: 'EduSABeginner',
  );

  static ThemeData bmi() {
    return ThemeData(
      textTheme: lightTextTheme,
        scaffoldBackgroundColor: primary900,
        cardColor: primaryLight,
        sliderTheme: const SliderThemeData(
            thumbColor: Colors.greenAccent,
            activeTrackColor: Colors.lightBlueAccent
        )
    );
  }

}