import 'package:bmi_calculate_app/bmi_calculate.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculate',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0b0e21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0b0e21),
        ),        
      ),
      home: BmiCalculate(),
    );
  }
}