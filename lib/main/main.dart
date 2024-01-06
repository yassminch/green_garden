import 'package:flutter/material.dart';
import '../pages/bienvenue.dart';



void main() {
  runApp(greenGarden());
}

class greenGarden extends StatelessWidget {
  const greenGarden({super.key});
  @override
  //confi d'application
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: Colors.green),
    ),
  ),
      title: "Green Garden",
      home: 
      bienvenue(),
    );
  }
}
